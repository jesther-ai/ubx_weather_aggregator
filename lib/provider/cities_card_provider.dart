import 'package:flutter/foundation.dart';
import 'package:ubx_weather_aggregator/utilities/api_request.dart';
import 'package:ubx_weather_aggregator/utilities/app_config.dart';

class City {
  final String? name;
  Map? data;
  City({@required this.name, this.data});
}

class CitiesProvider with ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = true;
  List<City> _cities = [
    City(name: 'London'),
    City(name: 'Seoul'),
    City(name: 'New York'),
    City(name: 'Tokyo'),
  ];

  //getter

  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  List<City> get cities => _cities;

  //setter

  loadData() async {
    reset();
    notifyListeners();
    for (var i = 0; i < _cities.length; i++) {
      Map<String, String> parameter = {'appid': AppConfig.key, 'units': 'metric', 'q': _cities[i].name!};
      Map<String, dynamic> value = await API().request(endPoint: '/weather', parameter: parameter);
      _cities[i].data = value;
      _isLoading = false;
      _isSuccess = true;
    }
    notifyListeners();
  }

  reset() {
    _isLoading = true;
    _isSuccess = false;
    _cities = [
      City(name: 'London'),
      City(name: 'Seoul'),
      City(name: 'New York'),
      City(name: 'Tokyo'),
    ];
  }
}
