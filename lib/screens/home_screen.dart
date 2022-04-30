import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:ubx_weather_aggregator/provider/main_card_provider.dart';
import 'package:ubx_weather_aggregator/provider/refresh_limit.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/dialog.dart';
import 'package:ubx_weather_aggregator/widgets/input_textfield.dart';
import 'package:ubx_weather_aggregator/widgets/location_card.dart';
import 'package:ubx_weather_aggregator/widgets/main_card.dart';
import 'package:ubx_weather_aggregator/widgets/other_city_card.dart';

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
        leadingWidth: 90,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Consumer<HomeProvider>(builder: (context, value, child) {
            return RefreshIndicator(
              color: Colors.white,
              backgroundColor: HexColor('#f46f20'),
              onRefresh: () => Future.delayed(const Duration(milliseconds: 100), () => onRefresh(context)),
              child: ListView(
                children: [
                  AnimationConfiguration.staggeredList(
                    position: 0,
                    duration: const Duration(milliseconds: 1000),
                    child: FadeInAnimation(
                      child: SlideAnimation(
                        verticalOffset: 100,
                        child: InputTextField(
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
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AnimationConfiguration.staggeredList(
                    position: 1,
                    duration: Duration(milliseconds: 1000),
                    child: FadeInAnimation(
                      child: SlideAnimation(
                        verticalOffset: 100,
                        child: LocationCard(location: 'Macabebe Pampanga', withLocation: true),
                      ),
                    ),
                  ),
                  const AnimationConfiguration.staggeredList(
                    position: 2,
                    duration: Duration(milliseconds: 1000),
                    child: FadeInAnimation(
                      child: SlideAnimation(
                        verticalOffset: 100,
                        child: MainCard(),
                      ),
                    ),
                  ),
                  const AnimationConfiguration.staggeredList(
                    position: 3,
                    duration: Duration(milliseconds: 1000),
                    child: FadeInAnimation(
                      child: SlideAnimation(
                        verticalOffset: 100,
                        child: LocationCard(location: 'Other City', withLocation: false),
                      ),
                    ),
                  ),
                  Container(
                    height: 220,
                    color: Colors.transparent,
                    child: AnimationLimiter(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.cities.length,
                        itemBuilder: (context, index) {
                          return OtherCityCard(index: index + 3);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  onRefresh(context) {
    RefreshLimit refreshLimit = Provider.of<RefreshLimit>(context, listen: false);
    HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: false);
    if (refreshLimit.onLimit) {
      refreshLimit.setCount();
      homeProvider.loadData();
    } else {
      refreshLimitDialog(context: context);
    }
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: false);
      if (!homeProvider.isSuccess) homeProvider.loadData();
    });
  }
}
