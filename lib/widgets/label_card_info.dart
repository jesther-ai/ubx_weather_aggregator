import 'package:flutter/material.dart';

class LabelCardInfo extends StatelessWidget {
  const LabelCardInfo({
    required this.label,
    required this.value,
    this.unit,
    Key? key,
  }) : super(key: key);
  final String label;
  final num? value;
  final String? unit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.20,
      // height: 130,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colors.white54,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value != null ? (value!.toStringAsFixed(1) + (unit ?? '')) : '--',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
