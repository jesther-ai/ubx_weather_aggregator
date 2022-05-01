import 'package:flutter/material.dart';

class UpdatedSince extends StatelessWidget {
  const UpdatedSince({
    required this.epoch,
    Key? key,
  }) : super(key: key);
  final int? epoch;
  @override
  Widget build(BuildContext context) {
    return Text(
      epoch != null ? 'Last Update: ${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(epoch! * 1000)).inMinutes.toString()} minutes ago' : 'Last Update: -- minutes ago',
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 11,
        color: Colors.white,
      ),
    );
  }
}
