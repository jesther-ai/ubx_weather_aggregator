import 'package:flutter/foundation.dart';
import 'package:ubx_weather_aggregator/utilities/api_request.dart';
import 'package:ubx_weather_aggregator/utilities/app_config.dart';
import 'package:geolocator/geolocator.dart';

class MainCardProvider with ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = true;
  Map _data = {};
  String? _locationToSearch;
  //getter
  Map get data => _data;
  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  String? get locationToSearch => _locationToSearch;
  //setter
  setLocationToSearch(value) => _locationToSearch = value;

  loadDataByName() {
    if (_locationToSearch != null) {
      _isLoading = true;
      _isSuccess = false;
      _data.clear();
      notifyListeners();
      Map<String, String> parameter = {'appid': AppConfig.key, 'units': 'metric', 'q': _locationToSearch!};
      API().request(endPoint: '/weather', parameter: parameter).then((value) {
        if (value['cod'] != '404') {
          _data = value;
          _isLoading = false;
          _isSuccess = true;
          notifyListeners();
        } else {
          _data['name'] = 'No city found...';
          _isLoading = false;
          _isSuccess = true;
          notifyListeners();
        }
      });
    }
  }

  loadData() async {
    reset();
    notifyListeners();
    Position? _result = await Geolocator.getLastKnownPosition();
    Map<String, String> parameter = {'appid': AppConfig.key, 'units': 'metric', 'lat': _result!.latitude.toString(), 'lon': _result.longitude.toString()};
    API().request(endPoint: '/weather', parameter: parameter).then((value) {
      _data = value;
      _isLoading = false;
      _isSuccess = true;
      notifyListeners();
    });
  }

  reset() {
    _locationToSearch = null;
    _isLoading = true;
    _isSuccess = false;
    _data.clear();
  }
}
