import 'package:flutter/foundation.dart';
import 'package:ubx_weather_aggregator/utilities/api_request.dart';
import 'package:ubx_weather_aggregator/utilities/app_config.dart';

class MainCardProvider with ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = true;
  Map _data = {};
  // bool _isSuccessCities = false;
  // bool _isLoadingCities = true;
  // final List<String> _cities = ['London', 'Seoul', 'New York', 'Tokyo'];

  //getter
  Map get data => _data;
  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;

  //setter

  loadData() {
    reset();
    notifyListeners();
    Map<String, String> parameter = {'appid': AppConfig.key, 'units': 'metric', 'q': 'Manila'};
    API().request(endPoint: '/weather', parameter: parameter).then((value) {
      _data = value;
      _isLoading = false;
      _isSuccess = true;
      notifyListeners();
    });
  }

  reset() {
    _isLoading = true;
    _isSuccess = false;
    _data.clear();
  }
}
