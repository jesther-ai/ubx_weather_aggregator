import 'package:flutter/material.dart';

class TemparatureSign extends StatelessWidget {
  const TemparatureSign({
    required this.temp,
    Key? key,
  }) : super(key: key);
  final String temp;
  @override
  Widget build(BuildContext context) {
    return Text(
      temp,
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 85,
        color: Colors.white,
      ),
    );
  }
}
