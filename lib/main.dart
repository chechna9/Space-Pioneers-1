import 'package:astro01/Screens/levelChoice.dart';
import 'package:astro01/Screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';
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
import 'Screens/documentation_details.dart';
import 'Screens/documentation_data.dart';
import 'Screens/documentation_swiper.dart';

const supabaseUrl = 'https://ltsahdljhuochhecajen.supabase.co';
const supabaseKey ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyMDQ3OTY4MiwiZXhwIjoxOTM2MDU1NjgyfQ.IoKgpB9APMw5Te9DYgbJZIbYcvPOwl41dl4-IKFjpVk';
final supabaseclient = SupabaseClient(supabaseUrl, supabaseKey);
void main() {
  Injector.appInstance.registerSingleton<SupabaseClient>(() => supabaseclient);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Gotham', //setting default font
      primaryColor: myBlue,

      primarySwatch: calendarColor,
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
      '/levelChoice': (context) => LevelChoice(),
      '/testing': (context) => Testing(),
      '/loadingScreen': (context) => LoadingScreen(),
      '/documentation': (context) => Documentation(),
    },
  ));
}
