import 'package:flutter/material.dart';
import 'package:news_app/Screen/CountryNews/view/countryPage.dart';
import 'package:news_app/Screen/HelthNews/view/HelthPage.dart';
import 'package:news_app/Screen/News/View/Home_Page.dart';

import '../Screen/Animal/view/AnimalPage.dart';

class TabBaar extends StatefulWidget {
  const TabBaar({Key? key}) : super(key: key);

  @override
  State<TabBaar> createState() => _TabBaarState();
}

class _TabBaarState extends State<TabBaar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown,
            title: Text(" News App"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: " NEWS",
                ),
                Tab(
                  text: "COUNTRY",
                ),
                Tab(
                  text: "HEALTH",
                ),
                Tab(
                  text: "ANIMAL",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Home_Page(),
              CountryPage(),
              HealthPage(),
              Animal_Page(),
            ],
          ),
        ),
      ),
    );
  }
}
