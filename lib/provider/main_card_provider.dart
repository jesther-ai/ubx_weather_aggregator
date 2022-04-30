import 'package:flutter/foundation.dart';
import 'package:ubx_weather_aggregator/utilities/api_request.dart';

class HomeProvider with ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = true;

  final List<String> _cities = ['London', 'Seoul', 'New York', 'Tokyo'];

  //getter
  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  List<String> get cities => _cities;

  //setter

  loadData() {
    API().request(endPoint: '/weather', query: 'Manila').then((value) {});
  }
}
