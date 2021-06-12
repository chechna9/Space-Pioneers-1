import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:astro01/components/constants.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';
import '../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

int splash = 1;
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future<String> _useremail;
Future<void> _setuseremail(String _useremail) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', _useremail);
  /* setState(() {
    prefs.setString('email', _useremail).then((bool success) {
      return 0;
    });
  });*/
}

Future<void> _clearremail() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.clear();
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Future<void> _getseremail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('affichage');
    print(prefs.getString('email'));
    setState(() {
      user.email = (prefs.getString('email') ?? null);
    });
    /*setState(() {
    final email = prefs.getString('email') ?? null;
    print('amail');
    print(email);
    user.email = email;
  });*/
  }

  @override
  void initState() {
    super.initState();
    //_clearremail();
    //_setuseremail('ja_khenfouf@esi.dz');
    void initState() {
      super.initState();
      _useremail = _prefs.then((SharedPreferences prefs) {
        return (prefs.getString('email') ?? 0);
      });
    }

    _getseremail();

    Timer(Duration(seconds: 5), () {
      Future.microtask(() async {
        await Duration(seconds: 5);
        if (user.email == null) {
          Navigator.pushNamed(context, '/splashScreen');
          (route) => false;
        } else {
          Navigator.pushNamed(context, '/homeScreen');
          (route) => false;
        }
      });
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: myRed,
        child: Center(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('SPACE PIONEERS'),
              ],
              // isRepeatingAnimation: true,
              displayFullTextOnTap: false,
              repeatForever: true,
            ),
          ),
        ),
      ),
    );
  }
}

/*@override
  void initState() {
    super.initState();
    final Supabaseclient = Injector.appInstance.get<SupabaseClient>();
    final userr = supabaseclient.auth.user();
    if (userr == null) {
      Navigator.pushNamed(context, '/splashScreen');
    } else {
      user.email = userr.email;
      Navigator.pushNamed(context, '/homeScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: myRed,
        child: Center(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('SPACE PIONEERS'),
              ],
              // isRepeatingAnimation: true,
              displayFullTextOnTap: false,
              repeatForever: true,
            ),
          ),
        ),
      ),
    );
  }
}*/
