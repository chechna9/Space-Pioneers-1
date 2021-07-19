import 'package:astro01/variable_globale/variable.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import '../components/constants.dart';
import '../main.dart';

// une page pour encourager l'utilisateur a jouer plus et apprendre ( afficher le nb ed points collectées dans la planéte "Random")
int etoilesRandom;
int indicesbravo;

class BravoNiveauR extends StatefulWidget {
  @override
  _BravoNiveauRState createState() => _BravoNiveauRState();
}

class _BravoNiveauRState extends State<BravoNiveauR> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/planetChoice');
      },
      child: Scaffold(
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
                      etoilesRandom == 300 &&
                      user.badges[9] == '0') {
                    List<String> badges = user.badges.split(
                        ""); // verfier s'il faut aller ala page braveau badge de random ou aller a planéte choice
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

                    /// specifier la taille du texte
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Gotham'),

                /// specifier le font du texte
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

                          /// specifier la taille du texte
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Gotham'),

                      /// specifier le font du texte
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$etoilesRandom étoiles !',
                      style: TextStyle(
                          color: myYellow,
                          fontSize: 24,

                          /// specifier la taille du texte
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Gotham'),

                      /// specifier le font du texte
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
      ),
    );
  }
}

void update_badges() async {
  // metre a jour les badges obtenue dans la base de données
  await supabaseclient
      .from("user")
      .update({"badges": user.badges})
      .eq("email", user.email)
      .execute();
}
