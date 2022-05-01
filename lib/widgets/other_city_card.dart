import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/label_card_info.dart';
import 'package:ubx_weather_aggregator/widgets/updated_since_info.dart';

class OtherCityCard extends StatelessWidget {
  const OtherCityCard({
    required this.index,
    required this.isEnd,
    required this.locationName,
    required this.desc,
    required this.icon,
    required this.temp,
    required this.humidt,
    required this.wind,
    required this.epoch,
    this.width,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final int index;
  final bool isEnd;
  final String? locationName;
  final String desc;
  final String icon;
  final num temp;
  final num humidt;
  final num wind;
  final int epoch;
  final double? width;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 1000),
      child: FadeInAnimation(
        child: SlideAnimation(
          horizontalOffset: 200,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: width ?? 300,
              margin: EdgeInsets.only(top: 20, bottom: 20, right: isEnd ? 3 : 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                boxShadow: width == null
                    ? const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2,
                          offset: Offset(2, 3), // Shadow position
                        ),
                      ]
                    : [],
                color: HexColor('#f46f20'),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
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
                            image: 'https://openweathermap.org/img/wn/' + icon + '@2x.png',
                          ),
                          Text(
                            desc.capitalized(),
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Location',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Colors.white54,
                            ),
                          ),
                          Text(
                            locationName ?? 'null',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelCardInfo(label: 'Temp', value: temp, unit: '°C'),
                      LabelCardInfo(label: 'Humidt', value: humidt, unit: '%'),
                      LabelCardInfo(label: 'Wind Speed', value: wind, unit: 'km'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  UpdatedSince(epoch: epoch),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension Capitalized on String {
  String capitalized() => this.substring(0, 1).toUpperCase() + this.substring(1).toLowerCase();
}
