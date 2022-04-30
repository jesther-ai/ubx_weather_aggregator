import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/input_textfield.dart';
import 'package:ubx_weather_aggregator/widgets/location_card.dart';
import 'package:ubx_weather_aggregator/widgets/main_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  final TextEditingController searchField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f46f20'),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        leading: Padding(padding: const EdgeInsets.only(left: 20), child: Image.asset('assets/images/ubxLogo.png')),
        title: Text(
          'Today, ' + DateFormat.MMMMd().format(DateTime.now()),
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          children: [
            const SizedBox(height: 20),
            InputTextField(
              controller: searchField,
              hintText: 'Pampanga Philippines',
              height: 55,
              keyboardType: TextInputType.text,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              prefixIconPadding: const EdgeInsets.only(bottom: 20, right: 5),
              suffixIconPadding: const EdgeInsets.only(bottom: 20, right: 5),
              prefixIcon: IconButton(
                onPressed: () {},
                iconSize: 25,
                icon: const Icon(Icons.location_on_outlined, color: Colors.black26),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                iconSize: 25,
                icon: const Icon(Icons.search, color: Colors.black),
              ),
              onChanged: (string) {},
            ),
            const SizedBox(height: 20),
            const LocationCard(location: 'Macabebe Pampanga'),
            const MainCard(),
          ],
        ),
      ),
    );
  }
}
