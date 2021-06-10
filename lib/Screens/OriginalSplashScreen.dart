import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:astro01/components/constants.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';
import '../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future<String> _useremail;
Future<void> _setuseremail(String _useremail) async {
  final SharedPreferences prefs = await _prefs;

  setState(() {
    prefs.setString('email', _useremail).then((bool success) {
      return 0;
    });
  });
}

Future<void> _getseremail() async {
  final SharedPreferences prefs = await _prefs;

  setState(() {
    user.email = (prefs.getString('counter') ?? null);
  });
}

Future<void> _clearremail() async {
  final SharedPreferences prefs = await _prefs;

  setState(() {
    prefs.clear();
  });
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      _getseremail();
      if (user.email == null) {
        Navigator.pushNamed(context, '/splashScreen');
      } else {
        Navigator.pushNamed(context, '/homeScreen');
      }
    });
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
void getEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  user.email = prefs.getString("email") ?? null;
  print(user.email);
}

void clearEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

void createEmail(String emaill) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("email", emaill);
}
