import 'package:flutter/material.dart';
import 'package:news_app/Screen/Animal/Provider/AnimalProvider.dart';
import 'package:news_app/Screen/Animal/view/AnimalPage.dart';
import 'package:news_app/Screen/CountryNews/provider/CountryProvider.dart';
import 'package:news_app/Screen/CountryNews/view/countryPage.dart';
import 'package:news_app/Screen/HelthNews/provider/HelthProvider.dart';
import 'package:news_app/Screen/HelthNews/view/HelthPage.dart';
import 'package:news_app/Screen/News/provider/NewsProvider.dart';
import 'package:news_app/Screen/News/View/Home_Page.dart';
import 'package:news_app/Utils/Tabbar.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CountryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HelthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AnimalProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => TabBaar(),
          'H': (context) => Home_Page(),
          'C': (context) => CountryPage(),
          'H': (context) => HealthPage(),
          'B': (context) => Animal_Page(),
        },
      ),
    ),
  );
}
