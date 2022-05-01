import 'package:flutter/material.dart';

class Clouds extends StatelessWidget {
  const Clouds({
    required this.description,
    required this.code,
    Key? key,
  }) : super(key: key);
  final String description;
  final String code;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeInImage.assetNetwork(
          fadeInCurve: Curves.easeInQuart,
          fadeOutCurve: Curves.easeInQuart,
          fadeOutDuration: const Duration(milliseconds: 1000),
          fadeInDuration: const Duration(milliseconds: 200),
          fit: BoxFit.cover,
          placeholderFit: BoxFit.cover,
          placeholderCacheHeight: 20,
          placeholderCacheWidth: 20,
          height: 65,
          width: 70,
          placeholder: 'assets/images/loading.gif',
          image: 'https://openweathermap.org/img/wn/' + code + '@2x.png',
        ),
        Text(
          description.capitalized(),
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

extension Capitalized on String {
  String capitalized() => this.substring(0, 1).toUpperCase() + this.substring(1).toLowerCase();
}
