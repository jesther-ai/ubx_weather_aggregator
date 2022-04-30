import 'package:flutter/material.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/temperature_card.dart';

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 2,
            offset: Offset(2, 3), // Shadow position
          ),
        ],
        color: HexColor('#ffdbc2'),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 300,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TemparatureSign(temp: '18°C'),
          const SizedBox(width: 10),
          const Clouds(code: '04d', description: 'Broken Clouds'),
        ],
      ),
    );
  }
}

class Clouds extends StatelessWidget {
  const Clouds({
    required this.description,
    required this.code,
    Key? key,
  }) : super(key: key);
  final String description;
  final String code;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeInImage.assetNetwork(
          fadeInCurve: Curves.easeInQuart,
          fadeOutCurve: Curves.easeInQuart,
          fadeOutDuration: const Duration(milliseconds: 1000),
          fadeInDuration: const Duration(milliseconds: 200),
          fit: BoxFit.cover,
          placeholderFit: BoxFit.cover,
          placeholderCacheHeight: 20,
          placeholderCacheWidth: 20,
          height: 65,
          width: 70,
          placeholder: 'assets/images/loading.gif',
          image: 'https://openweathermap.org/img/wn/' + code + '@2x.png',
        ),
        Text(
          description,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
