import 'package:flutter/material.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/input_textfield.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    required this.onTap,
    required this.onChanged,
    required this.onPressedLocation,
    required this.onPressedSearch,
    required this.controller,
    required this.focus,
  }) : super(key: key);
  final FocusNode focus;
  final TextEditingController controller;
  final Function()? onTap;
  final Function(String?) onChanged;
  final Function()? onPressedLocation;
  final Function()? onPressedSearch;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputTextField(
          focusNode: focus,
          controller: controller,
          hintText: 'Ex. Pampanga Philippines',
          height: 55,
          width: MediaQuery.of(context).size.width * 0.55,
          keyboardType: TextInputType.text,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          onChanged: onChanged,
          onTap: onTap,
        ),
        const SizedBox(width: 15),
        IconButton(onPressed: onPressedSearch, icon: Icon(Icons.search, color: HexColor('#f46f20'))),
        const SizedBox(width: 15),
        IconButton(onPressed: onPressedLocation, icon: Icon(Icons.location_on_outlined, color: HexColor('#f46f20'))),
      ],
    );
  }
}
