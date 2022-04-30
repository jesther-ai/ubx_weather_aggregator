import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubx_weather_aggregator/provider/main_card_provider.dart';
import 'package:ubx_weather_aggregator/provider/refresh_limit.dart';
import 'package:ubx_weather_aggregator/utilities/dismiss_keyboard.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<RefreshLimit>(create: (context) => RefreshLimit()),
          ChangeNotifierProvider<MainCardProvider>(create: (context) => MainCardProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UBX Weather Aggregator',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
