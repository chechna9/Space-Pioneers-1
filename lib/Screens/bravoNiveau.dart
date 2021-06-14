import 'package:astro01/Screens/bravoNiveauR.dart';
import 'package:astro01/Screens/quiz.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import '../components/constants.dart';
import 'quiz.dart';
import '../main.dart';

int etoiles;
int etoilesMax;
int indices;
int difference;
String planeteNAME = planeteName.inCaps;

class BravoNiveau extends StatefulWidget {
  @override
  _BravoNiveauState createState() => _BravoNiveauState();
}

class _BravoNiveauState extends State<BravoNiveau> {
  @override
  Widget build(BuildContext context) {
    print("difference bravo");
    print(difference);

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
                    etoiles == 100 &&
                    user.badges[indicesbravo] == '0') {
                  List<String> badges = user.badges.split("");

                  badges[indicesbravo] = '1';

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
                    '$etoiles étoiles !',
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Nombre maximale d'étoiles \n collectées dans $planeteNAME :",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Gotham'),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "$etoilesMax",
                      style: TextStyle(
                          color: myYellow,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Gotham'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "\nEtoiles ajoutés :  ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Gotham'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "$difference",
                    style: TextStyle(
                        color: myYellow,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Gotham'),
                    textAlign: TextAlign.center,
                  ),
                ])
              ],
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
