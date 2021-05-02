import 'package:flutter/material.dart';
import 'Screens/inscription.dart';
import 'Screens/home.dart';
import 'Screens/testing.dart';
import 'Screens/login.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Gotham', //setting default font
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/inscription': (context) => Inscription(),
        '/login': (context) => Login(),
        '/testing': (context) => Testing(),
      },
    ));
