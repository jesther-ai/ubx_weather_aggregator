import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/app_bar_continer.dart';
import 'package:ubx_weather_aggregator/widgets/info_card.dart';
import 'package:ubx_weather_aggregator/widgets/sliver_app.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({Key? key}) : super(key: key);
  static const routeName = '/detailedScreen';
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return UbxSliverAppBar(
      tabNumber: 3,
      title: 'Details',
      backgroundImage: 'assets/images/ubxLogo.png',
      appBarContainer: AppbarContiner(
        width: double.infinity,
        isEnd: true,
        index: 0,
        locationName: data['name'],
        icon: '01d',
        desc: '--',
        sunSet: data['sys']['sunset'],
        sunRise: data['sys']['sunrise'],
        country: data['sys']['country'],
        epoch: data['dt'],
      ),
      bottom: AnimationConfiguration.staggeredList(
        position: 0,
        duration: const Duration(milliseconds: 500),
        child: FadeInAnimation(
          duration: const Duration(milliseconds: 500),
          child: SlideAnimation(
            verticalOffset: 10,
            child: Container(
              color: Colors.white,
              child: TabBar(
                indicatorWeight: 5,
                onTap: (value) {},
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
                labelPadding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                labelColor: Colors.black,
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: HexColor('#7D9297'),
                ),
                unselectedLabelColor: Colors.grey,
                indicatorColor: HexColor('#f46f20'),
                labelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: HexColor('#006B83'),
                ),
                isScrollable: true,
                tabs: const [
                  Text('WEATHER'),
                  Text('WIND'),
                  Text('OTHER INFORMATION'),
                ],
              ),
            ),
          ),
        ),
      ),
      container: SizedBox(
        height: 750,
        width: double.infinity,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            WeatherTab(data: data),
            WindTab(data: data),
            OtherInfo(data: data),
          ],
        ),
      ),
    );
  }
}

class WeatherTab extends StatelessWidget {
  const WeatherTab({
    required this.data,
    Key? key,
  }) : super(key: key);
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 90, // here set custom Height You Want
        ),
        padding: const EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          InfoCard(index: 0, iconData: Icons.thermostat_sharp, label: 'Temperature', value: data['main']['temp'].toString() + ' °C'),
          InfoCard(index: 1, iconData: Icons.thermostat_sharp, label: 'Feels like', value: data['main']['feels_like'].toString() + ' °C'),
          InfoCard(index: 2, iconData: Icons.thermostat_sharp, label: 'Minimum Temp', value: data['main']['temp_min'].toString() + ' °C'),
          InfoCard(index: 3, iconData: Icons.thermostat_sharp, label: 'Maximum Temp', value: data['main']['temp_max'].toString() + ' °C'),
          InfoCard(index: 4, iconData: Icons.air_outlined, label: 'Pressure', value: data['main']['pressure'].toString() + ' hPa'),
          InfoCard(index: 4, iconData: Icons.water, label: 'Humidity', value: data['main']['humidity'].toString() + ' %'),
          InfoCard(index: 4, iconData: Icons.opacity, label: 'Sea Level', value: data['main']['sea_level'].toString() + ' m'),
          InfoCard(index: 4, iconData: Icons.landscape, label: 'Ground Level', value: data['main']['grnd_level'].toString() + ' m'),
          InfoCard(index: 4, iconData: Icons.remove_red_eye_outlined, label: 'Visibility', value: data['visibility'].toString() + ' m'),
        ],
      ),
    );
  }
}

class WindTab extends StatelessWidget {
  const WindTab({
    required this.data,
    Key? key,
  }) : super(key: key);
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 90, // here set custom Height You Want
        ),
        padding: const EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          InfoCard(index: 0, iconData: Icons.air_sharp, label: 'Speed', value: data['wind']['speed'].toString() + ' mph'),
          InfoCard(index: 1, iconData: Icons.directions, label: 'Degree', value: data['wind']['deg'].toString() + ' °'),
          InfoCard(index: 2, iconData: Icons.air_outlined, label: 'Gust', value: data['wind']['gust'].toString() + ' mph'),
        ],
      ),
    );
  }
}

class OtherInfo extends StatelessWidget {
  const OtherInfo({
    required this.data,
    Key? key,
  }) : super(key: key);
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 90, // here set custom Height You Want
        ),
        padding: const EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          InfoCard(index: 0, iconData: Icons.rule_rounded, label: 'Latitude', value: data['coord']['lat'].toStringAsFixed(3) + ' °'),
          InfoCard(index: 1, iconData: Icons.rule_rounded, label: 'Longitude', value: data['coord']['lon'].toStringAsFixed(3) + ' °'),
          InfoCard(index: 2, iconData: Icons.timer, label: 'Timezone', value: data['timezone'].toString()),
          InfoCard(index: 2, iconData: Icons.timer, label: 'Time Update', value: '${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000)).inMinutes.toString()} min'),
        ],
      ),
    );
  }
}
