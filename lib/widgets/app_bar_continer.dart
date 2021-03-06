import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/label_card_info.dart';
import 'package:ubx_weather_aggregator/widgets/updated_since_info.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    required this.index,
    required this.isEnd,
    required this.locationName,
    required this.desc,
    required this.icon,
    required this.sunSet,
    required this.sunRise,
    required this.country,
    required this.epoch,
    this.width,
    Key? key,
  }) : super(key: key);
  final int index;
  final bool isEnd;
  final String? locationName;
  final String desc;
  final String icon;
  final int sunSet;
  final int sunRise;
  final String country;
  final int epoch;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 1000),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 200,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: HexColor('#f46f20'),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locationName ?? 'null',
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 35,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelCardInfoString(label: 'Sun Rise', value: DateFormat.jms().format(DateTime.fromMillisecondsSinceEpoch(sunRise * 1000))),
                    LabelCardInfoString(label: 'Country', value: country),
                    LabelCardInfoString(label: 'Sun Set', value: DateFormat.jms().format(DateTime.fromMillisecondsSinceEpoch(sunSet * 1000))),
                  ],
                ),
                const SizedBox(height: 20),
                UpdatedSince(epoch: epoch),
              ],
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
