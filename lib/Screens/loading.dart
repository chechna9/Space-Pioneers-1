import 'package:animated_widgets/animated_widgets.dart';
import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:astro01/components/constants.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> { // animation de chargement (étoile qui tourne) avant de connexion ou d'inscription au compte
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: myGradiant,
        ),
        child: Center(
          child: Transform.rotate(
            angle: 4,
            child: ShakeAnimatedWidget(
              enabled: true,
              shakeAngle: Rotation.deg(z: 15),
              duration: Duration(milliseconds: 900),
              curve: Curves.linear,
              child: ScaleAnimatedWidget.tween(
                duration: Duration(milliseconds: 2600),
                scaleDisabled: 0.2,
                scaleEnabled: 1,
                child: Image.asset(
                  'assets/images/other/star.png',
                  scale: 0.7,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
