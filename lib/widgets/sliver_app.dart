import 'package:flutter/material.dart';
import 'package:ubx_weather_aggregator/utilities/hex_color.dart';

// ignore: must_be_immutable
class UbxSliverAppBar extends StatelessWidget {
  UbxSliverAppBar({
    Key? key,
    required this.container,
    this.drawer,
    this.bottom,
    required this.backgroundImage,
    required this.title,
    this.appBarContainer,
    this.floatingActionButton,
    this.tabNumber = 1,
    this.expandedHeight = 250,
    this.isImageUrl = false,
    this.heroTag = '',
  }) : super(key: key);

  final Widget container;
  final Widget? drawer;
  final Widget? bottom;
  final Widget? appBarContainer;
  final Widget? floatingActionButton;
  final String? backgroundImage;
  final String title;
  final double expandedHeight;
  final int tabNumber;
  final bool isImageUrl;
  final String heroTag;

  var top = 0.0;
  bool scrolled = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var navBarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          child: Scaffold(
            key: _key,
            drawer: drawer,
            body: Container(
              color: Colors.white,
              child: DefaultTabController(
                length: tabNumber,
                initialIndex: 0,
                child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        expandedHeight: expandedHeight,
                        elevation: 0,
                        floating: false,
                        pinned: true,
                        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back, color: Colors.white)),
                        flexibleSpace: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            top = constraints.biggest.height;
                            return FlexibleSpaceBar(
                              title: Text(
                                top == 144.0 ? title : '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20,
                                  color: HexColor('#f46f20'),
                                ),
                              ),
                              centerTitle: true,
                              titlePadding: const EdgeInsets.only(top: 0, bottom: 65),
                              background: AnimatedContainer(
                                duration: const Duration(milliseconds: 50),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    !isImageUrl
                                        ? SizedBox(
                                            height: 750,
                                            width: double.infinity,
                                            child: Hero(
                                              tag: heroTag,
                                              transitionOnUserGestures: true,
                                              child: Image.asset(
                                                backgroundImage!,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : Hero(
                                            tag: heroTag,
                                            transitionOnUserGestures: true,
                                            child: Image.network(
                                              backgroundImage!,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ),
                                          ),
                                    Positioned(
                                      child: appBarContainer!,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        backgroundColor: Colors.white,
                        iconTheme: const IconThemeData(
                          color: Colors.red, //change your color here
                        ),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight((bottom != null) ? 40.0 : 0.0),
                          child: (bottom != null)
                              ? Container(
                                  color: Colors.white,
                                  child: bottom!,
                                )
                              : Container(),
                        ),
                      ),
                    ];
                  },
                  body: SafeArea(top: false, child: container),
                ),
              ),
            ),
            floatingActionButton: floatingActionButton,
          ),
          data: MediaQuery.of(context).copyWith(textScaleFactor: 0.95),
        );
      },
    );
  }
}
