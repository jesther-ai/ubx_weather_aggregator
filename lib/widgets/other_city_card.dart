import 'package:flutter/material.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';

class OtherCityCard extends StatelessWidget {
  const OtherCityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      margin: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 2,
            offset: Offset(2, 3), // Shadow position
          ),
        ],
        color: HexColor('#f46f20'),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
