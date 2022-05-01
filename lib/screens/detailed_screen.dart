import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/app_bar_continer.dart';
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
            Container(color: Colors.white),
            const SizedBox(),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
