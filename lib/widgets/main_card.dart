import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubx_weather_aggregator/provider/main_card_provider.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/clouds_section.dart';
import 'package:ubx_weather_aggregator/widgets/label_card_info.dart';
import 'package:ubx_weather_aggregator/widgets/temperature_card.dart';
import 'package:ubx_weather_aggregator/widgets/updated_since_info.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
          color: HexColor('#f46f20'),
          borderRadius: BorderRadius.circular(12.0),
        ),
        height: 265,
        width: double.infinity,
        child: Consumer<MainCardProvider>(builder: (context, value, child) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TemparatureSign(temp: value.data['main'] != null ? value.data['main']['temp'] : 0),
                  const SizedBox(width: 10),
                  Clouds(code: value.data['weather'] != null ? value.data['weather'][0]['icon'] : '01d', description: value.data['weather'] != null ? value.data['weather'][0]['description'] : '--'),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelCardInfo(label: 'Min Temp', value: value.data['main'] != null ? value.data['main']['temp_min'] : null, unit: '°C'),
                  LabelCardInfo(label: 'Max Temp', value: value.data['main'] != null ? value.data['main']['temp_max'] : null, unit: '°C'),
                  LabelCardInfo(label: 'Feels', value: value.data['main'] != null ? value.data['main']['feels_like'] : null, unit: '°C'),
                  LabelCardInfo(label: 'Pressure', value: value.data['main'] != null ? value.data['main']['pressure'] : null),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LabelCardInfo(label: 'Wind Speed', value: value.data['wind'] != null ? value.data['wind']['speed'] : null, unit: 'km'),
                  LabelCardInfo(label: 'Wind Deg', value: value.data['wind'] != null ? value.data['wind']['deg'] : null, unit: '°'),
                  LabelCardInfo(label: 'Wind Gust', value: value.data['wind'] != null ? value.data['wind']['gust'] : null),
                  LabelCardInfo(label: 'Humidt', value: value.data['wind'] != null ? value.data['main']['humidity'] : null, unit: '%'),
                ],
              ),
              const SizedBox(height: 15),
              UpdatedSince(epoch: value.data['dt']),
            ],
          );
        }),
      ),
    );
  }
}
