import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 1500),
      child: FadeInAnimation(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: HexColor('#f46f20'),
                  strokeWidth: 2.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
