import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/label_card_info.dart';

class OtherCityCard extends StatelessWidget {
  const OtherCityCard({
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 1000),
      child: FadeInAnimation(
        child: SlideAnimation(
          horizontalOffset: 200,
          child: Container(
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      image: 'https://openweathermap.org/img/wn/' + '04d' + '@2x.png',
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
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
                          'Manila',
                          style: TextStyle(
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
                const SizedBox(height: 20),
                Row(
                  children: const [
                    LabelCardInfo(label: 'Min Temp', value: '18°C'),
                    LabelCardInfo(label: 'Humidt', value: '62%'),
                    LabelCardInfo(label: 'Wind Speed', value: '3.6km'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
