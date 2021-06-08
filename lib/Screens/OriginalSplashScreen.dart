import 'package:astro01/variable_globale/variable.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';
import '../main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
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
    return Container();
  }
}
