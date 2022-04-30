import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        leadingWidth: 80,
        leading: Padding(padding: const EdgeInsets.only(left: 20), child: Image.asset('assets/images/ubxLogo.png')),
        title: Text(
          'Weather Aggregator',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 25,
            color: HexColor('#f46f20'),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
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
                  icon: Icon(Icons.location_on_outlined, color: HexColor('#f46f20')),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  iconSize: 25,
                  icon: Icon(Icons.search, color: HexColor('#f46f20')),
                ),
                onChanged: (string) {},
              ),
              const SizedBox(height: 20),
              const LocationCard(location: 'Macabebe Pampanga', withLocation: true),
              const MainCard(),
              const LocationCard(location: 'Other City', withLocation: false),
              const OtherCityCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherCityCard extends StatelessWidget {
  const OtherCityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 250,
      color: Colors.red,
    );
  }
}
