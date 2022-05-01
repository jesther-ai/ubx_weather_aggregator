import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:ubx_weather_aggregator/provider/cities_card_provider.dart';
import 'package:ubx_weather_aggregator/provider/main_card_provider.dart';
import 'package:ubx_weather_aggregator/provider/refresh_limit.dart';
import 'package:ubx_weather_aggregator/screens/detailed_screen.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';
import 'package:ubx_weather_aggregator/widgets/dialog.dart';
import 'package:ubx_weather_aggregator/widgets/loading_indicator.dart';
import 'package:ubx_weather_aggregator/widgets/location_card.dart';
import 'package:ubx_weather_aggregator/widgets/main_card.dart';
import 'package:ubx_weather_aggregator/widgets/other_city_card.dart';
import 'package:ubx_weather_aggregator/widgets/search_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  final TextEditingController searchField = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    initState(context);
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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Consumer2<MainCardProvider, CitiesProvider>(builder: (context, value, value1, child) {
            searchField.text = value.locationToSearch ?? '';
            return RefreshIndicator(
              color: Colors.white,
              backgroundColor: HexColor('#f46f20'),
              onRefresh: () => Future.delayed(const Duration(milliseconds: 100), () => onRefresh(context)),
              child: ListView(
                children: [
                  const SizedBox(height: 30),
                  AnimationConfiguration.staggeredList(
                    position: 0,
                    duration: const Duration(milliseconds: 1000),
                    child: FadeInAnimation(
                      child: SlideAnimation(
                        verticalOffset: 100,
                        child: SearchCard(
                          focus: searchFocus,
                          controller: searchField,
                          onChanged: (string) => value.setLocationToSearch(string),
                          onTap: () {
                            searchField.text = '';
                            value.setLocationToSearch('');
                          },
                          onPressedSearch: () {
                            value.loadDataByName();
                            searchFocus.unfocus();
                          },
                          onPressedLocation: () {
                            value.loadData();
                            searchFocus.unfocus();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AnimationConfiguration.staggeredList(
                    position: 1,
                    duration: const Duration(milliseconds: 1000),
                    child: FadeInAnimation(
                      child: SlideAnimation(
                        verticalOffset: 100,
                        child: value.isSuccess ? LocationCard(location: value.data['name'], withLocation: value.locationToSearch == null) : const LocationCard(location: 'Searching...', withLocation: false),
                      ),
                    ),
                  ),
                  value.isSuccess
                      ? AnimationConfiguration.staggeredList(
                          position: 2,
                          duration: const Duration(milliseconds: 1000),
                          child: FadeInAnimation(
                            child: SlideAnimation(
                              verticalOffset: 100,
                              child: MainCard(
                                onTap: () => Navigator.of(context).pushNamed(DetailedScreen.routeName),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          padding: const EdgeInsets.all(15),
                          height: 265,
                          width: double.infinity,
                          child: const LoadingIndicator(),
                        ),
                  const AnimationConfiguration.staggeredList(
                    position: 3,
                    duration: Duration(milliseconds: 1000),
                    child: FadeInAnimation(
                      child: SlideAnimation(
                        verticalOffset: 100,
                        child: LocationCard(location: 'Popular Cities', withLocation: false),
                      ),
                    ),
                  ),
                  value1.isSuccess
                      ? Container(
                          height: 235,
                          color: Colors.transparent,
                          child: AnimationLimiter(
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: value1.cities.length,
                              itemBuilder: (context, index) {
                                return OtherCityCard(
                                  isEnd: index + 1 == value1.cities.length,
                                  index: index + 3,
                                  locationName: value1.cities[index].name,
                                  icon: value1.cities[index].data != null ? value1.cities[index].data!['weather'][0]['icon'] : '01d',
                                  desc: value1.cities[index].data != null ? value1.cities[index].data!['weather'][0]['description'] : '--',
                                  humidt: value1.cities[index].data != null ? value1.cities[index].data!['main']['humidity'] : 00,
                                  temp: value1.cities[index].data != null ? value1.cities[index].data!['main']['temp'] : 00,
                                  wind: value1.cities[index].data != null ? value1.cities[index].data!['wind']['speed'] : 00,
                                  epoch: value1.cities[index].data != null ? value1.cities[index].data!['dt'] : 00,
                                );
                              },
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          padding: const EdgeInsets.all(15),
                          height: 235,
                          width: double.infinity,
                          child: const LoadingIndicator(),
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
    MainCardProvider mainCardProvider = Provider.of<MainCardProvider>(context, listen: false);
    CitiesProvider citiesProvider = Provider.of<CitiesProvider>(context, listen: false);
    if (refreshLimit.onLimit) {
      refreshLimit.setCount();
      mainCardProvider.loadData();
      citiesProvider.loadData();
    } else {
      refreshLimitDialog(context: context);
    }
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      MainCardProvider mainCardProvider = Provider.of<MainCardProvider>(context, listen: false);
      CitiesProvider citiesProvider = Provider.of<CitiesProvider>(context, listen: false);
      if (!mainCardProvider.isSuccess) mainCardProvider.loadData();
      if (!citiesProvider.isSuccess) citiesProvider.loadData();
    });
  }
}
