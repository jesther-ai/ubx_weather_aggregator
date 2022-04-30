import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    required this.location,
    Key? key,
  }) : super(key: key);
  final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          location,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 5),
        const Icon(Icons.location_on_outlined, color: Colors.white)
      ],
    );
  }
}
