import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.index,
    this.iconData,
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);
  final int index;
  final IconData? iconData;
  final String label;
  final String value;
  final Duration duration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      columnCount: 3,
      position: index,
      duration: duration,
      child: ScaleAnimation(
        duration: duration,
        child: FadeInAnimation(
          duration: duration,
          child: FlipAnimation(
            duration: duration,
            child: Container(
              width: 40,
              height: 20,
              margin: const EdgeInsets.all(2),
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
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(iconData ?? Icons.sunny_snowing, color: Colors.white),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Flexible(
                        child: Text(
                          value.contains('null ') ? '--' : value,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
