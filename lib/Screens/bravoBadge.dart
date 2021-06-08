import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'package:polygon_clipper/polygon_border.dart';
import '../components/constants.dart';

String avatar = "default";
String Badge = "Terre Hero";

class BravoBadge extends StatefulWidget {
  @override
  _BravoBadgeState createState() => _BravoBadgeState();
}

class _BravoBadgeState extends State<BravoBadge> {
  @override
  Widget build(BuildContext context) {
    print('bravo');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.cancel_outlined),
              color: myGrey,
              iconSize: 30,
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/planetChoice'),
            ),
          ),
        ],
      ),
      backgroundColor: myBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              Text(
                'BRAVO !',
                style: TextStyle(
                    color: myYellow,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Gotham'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'Vous avez obtenu \n\ un nouveau badge !',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Gotham'),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Container(
                  height: 146,
                  width: 146,
                  padding: EdgeInsets.all(4),
                  decoration: ShapeDecoration(
                    color: myYellow,
                    shape: PolygonBorder(sides: 6),
                  ),
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: PolygonBorder(sides: 6),
                      image: DecorationImage(
                        image: AssetImage('assets/images/avatars/default.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                '$Badge',
                style: TextStyle(
                    color: myYellow,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Gotham'),
              ),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Allez voir vos badges',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Gotham'),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_outlined),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () => {
                            Navigator.pushReplacementNamed(
                                context, '/profilePage'),
                          }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
