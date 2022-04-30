import 'package:flutter/material.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    required this.location,
    required this.withLocation,
    Key? key,
  }) : super(key: key);
  final String location;
  final bool withLocation;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          location,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 25,
            color: HexColor('#f46f20'),
          ),
        ),
        const SizedBox(width: 5),
        withLocation ? Icon(Icons.location_on_outlined, color: HexColor('#f46f20')) : const SizedBox()
      ],
    );
  }
}
