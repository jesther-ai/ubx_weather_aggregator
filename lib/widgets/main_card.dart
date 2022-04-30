import 'package:flutter/material.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/clouds_section.dart';
import 'package:ubx_weather_aggregator/widgets/label_card_info.dart';
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
      // height: 300,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TemparatureSign(temp: '18°C'),
              SizedBox(width: 10),
              Clouds(code: '04d', description: 'Broken Clouds'),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              LabelCardInfo(label: 'Min Temp', value: '18°C'),
              LabelCardInfo(label: 'Max Temp', value: '34°C'),
              LabelCardInfo(label: 'Feels', value: '34°C'),
              LabelCardInfo(label: 'Pressure', value: '1008'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              LabelCardInfo(label: 'Wind Speed', value: '3.6km'),
              LabelCardInfo(label: 'Wind Deg', value: '130°'),
              LabelCardInfo(label: 'Humidt', value: '62%'),
              LabelCardInfo(label: 'Visibility', value: '10000'),
            ],
          ),
        ],
      ),
    );
  }
}
