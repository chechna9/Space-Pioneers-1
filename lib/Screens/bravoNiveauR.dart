import 'package:astro01/Screens/levelChoice.dart';
import 'package:astro01/Screens/quiz.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import '../components/constants.dart';
import 'randomSection.dart';
import '../main.dart';
import '../classes/trace.dart';

int etoilesRandom;
int indicesbravo;

class BravoNiveauR extends StatefulWidget {
  @override
  _BravoNiveauRState createState() => _BravoNiveauRState();
}

class _BravoNiveauRState extends State<BravoNiveauR> {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                if (ableToBadge == true &&
                     etoilesRandom == 15 &&
                    user.badges[9] == '0') {
                  List<String> badges = user.badges.split("");
                  badges[9] = '1';
                  user.badges = badges.join("");
                  update_badges();
                  Navigator.pushReplacementNamed(context, '/bravoBadge');
                } else {
                  Navigator.pushReplacementNamed(context, '/planetChoice');
                }
              },
            ),
          ),
        ],
      ),
      backgroundColor: myRed,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              child: Column(
                children: [
                  Text(
                    'Vous avez collecté',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Gotham'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '$etoilesRandom étoiles !',
                    style: TextStyle(
                        color: myYellow,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Gotham'),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Image(
                image: AssetImage('assets/images/avatars/rocket_badge.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void update_badges() async {
  await supabaseclient
      .from("user")
      .update({"badges": user.badges})
      .eq("email", user.email)
      .execute();
}
