import 'package:flutter/material.dart';
import 'Screens/inscription.dart';
import 'Screens/splashScreen.dart';
import 'Screens/testing.dart';
import 'Screens/login.dart';
import 'Screens/leaderBoard.dart';
import 'components/constants.dart';
import 'Screens/homeScreen.dart';
import 'Screens/shopPage.dart';
import 'Screens/avatarPage.dart';
import 'Screens/profilePage.dart';
import 'Screens/planetChoice.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Gotham', //setting default font
        primaryColor: myBlue,
      ),
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen': (context) => SplashScreen(),
        '/inscription': (context) => Inscription(),
        '/login': (context) => Login(),
        '/leaderBoard': (context) => LeaderBoard(),
        '/homeScreen': (context) => HomeScreen(),
        '/shopPage': (context) => ShopPage(),
        '/avatarPage': (context) => AvatarPage(avatarController.stream),
        '/profilePage': (context) => ProfilePage(),
        '/planetChoice': (context) => PlanetChoice(),
        '/testing': (context) => Testing(),
      },
    ));
