import 'package:flutter/material.dart';
import 'inscription.dart';
import 'SplashScreen.dart';
import 'login.dart';
import 'testing.dart';
import 'quiz.dart';
import 'bravoBadge.dart';
import 'bravoNiveau.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Gotham', //setting default font
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => SplashScreen(),
        '/inscription': (context) => Inscription(),
        '/login': (context) => Login(),
        '/quiz' : (context) => Quiz(),
        '/testing': (context) => Testing(),
        '/bravoBdg' : (context) => BravoBadge(),
        '/bravoNiv' : (context) => BravoNiveau(),
              },
    ));
