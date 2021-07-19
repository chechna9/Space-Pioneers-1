import 'package:astro01/Screens/quiz.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import '../components/constants.dart';
import 'quiz.dart';
import '../main.dart';
// une page pour encourager l'utilisateur a jouer plus et apprendre ( afficher le nb ed points collectées dans cette planéte)

int etoiles;
int etoilesMax;
int indicesbr;
int difference;

class BravoNiveau extends StatefulWidget {
  @override
  _BravoNiveauState createState() => _BravoNiveauState();
}

class _BravoNiveauState extends State<BravoNiveau> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // un boutton pour retourner a la page planete choice
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
                      etoiles == 100 &&
                      user.badges[indicesbr] == '0') {
                    /// verefier s'il faut allez a la page de braveau de badge sinon retourer a planetechoice
                    List<String> badges = user.badges.split("");

                    badges[indicesbr] = '1';

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

                    /// specifier le taille du texte

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

                          /// specifier le taille du texte
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Gotham'),

                      /// specifier le font du texte
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$etoiles étoiles !',
                      style: TextStyle(
                          color: myYellow,
                          fontSize: 24,

                          /// specifier le taille du texte
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Nombre maximale d'étoiles \n collectées dans ${planeteNAME.inCaps} :",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,

                            /// specifier la taille du texte
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Gotham'),

                        /// specifier le font du texte
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "$etoilesMax",
                        style: TextStyle(
                            color: myYellow,
                            fontSize: 18,

                            /// specifier la taille du texte
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Gotham'),

                        /// specifier le font du texte
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\nEtoiles ajoutés :  ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,

                              /// specifier la taille du texte
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Gotham'),

                          /// specifier le font du texte
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "$difference",
                          style: TextStyle(
                              color: myYellow,
                              fontSize: 18,

                              /// specifier la taille du texte
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Gotham'),

                          /// specifier le font du texte
                          textAlign: TextAlign.center,
                        ),
                      ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void update_badges() async {
  // modifier les badges obtenue par l'utilisateur dans la base de données
  await supabaseclient
      .from("user")
      .update({"badges": user.badges})
      .eq("email", user.email)
      .execute();
}
