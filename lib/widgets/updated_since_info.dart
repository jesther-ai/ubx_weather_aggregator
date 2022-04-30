import 'package:flutter/material.dart';

class UpdatedSince extends StatelessWidget {
  const UpdatedSince({
    required this.epoch,
    Key? key,
  }) : super(key: key);
  final int epoch;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Last Update: ${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(epoch * 1000)).inMinutes.toString()} minutes ago',
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 11,
        color: Colors.white,
      ),
    );
  }
}
