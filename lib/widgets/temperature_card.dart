import 'package:flutter/material.dart';

class TemparatureSign extends StatelessWidget {
  const TemparatureSign({
    required this.temp,
    Key? key,
  }) : super(key: key);
  final double? temp;
  @override
  Widget build(BuildContext context) {
    return Text(
      temp != null ? (temp!.toStringAsFixed(1) + '°C') : '--',
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 60,
        color: Colors.white,
      ),
    );
  }
}
