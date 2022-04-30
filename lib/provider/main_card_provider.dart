import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier {
  final List<String> _cities = ['London', 'Seoul', 'New York', 'Tokyo'];

  //getter
  List<String> get cities => _cities;

  //setter
}
