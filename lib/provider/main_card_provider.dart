import 'package:flutter/foundation.dart';
import 'package:ubx_weather_aggregator/utilities/api_request.dart';
import 'package:ubx_weather_aggregator/utilities/app_config.dart';

class HomeProvider with ChangeNotifier {
  bool _isSuccessMainCard = false;
  bool _isLoadingMainCard = true;
  Map _dataMainCard = {};
  bool _isSuccessCities = false;
  bool _isLoadingCities = true;
  final List<String> _cities = ['London', 'Seoul', 'New York', 'Tokyo'];

  //getter
  Map get dataMainCard => _dataMainCard;
  bool get isSuccessMainCard => _isSuccessMainCard;
  bool get isLoadingMainCard => _isLoadingMainCard;
  List<String> get cities => _cities;

  //setter

  loadDataMainCard() {
    reset();
    notifyListeners();
    Map<String, String> parameter = {'appid': AppConfig.key, 'units': 'metric', 'q': 'Manila'};
    API().request(endPoint: '/weather', parameter: parameter).then((value) {
      _dataMainCard = value;
      _isLoadingMainCard = false;
      _isSuccessMainCard = true;
      notifyListeners();
    });
  }

  loadDataCities() {}

  reset() {
    _isLoadingMainCard = true;
    _isSuccessMainCard = false;
    _dataMainCard.clear();
  }
}
