import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:polygon_clipper/polygon_border.dart';
import '../components/constants.dart';
import 'quiz.dart';
// une page pour encourager l'utilisateur a jouer plus et apprendre ( afficherdans le cas ou il a obtenue le badge ed cette planéte)

class BravoBadge extends StatefulWidget {
  @override
  _BravoBadgeState createState() => _BravoBadgeState();
}

class _BravoBadgeState extends State<BravoBadge> {
  @override
  Widget build(BuildContext context) {
    String planeteNAME2 = planeteNAME;
    planeteNAME = BadgePlanete[planeteNAME];
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
                onPressed: () => Navigator.pushReplacementNamed(context,
                    '/planetChoice'), // un boutton pour retourner a la page planete choice
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

                      /// specifier le taille du texte
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Gotham'),

                  /// specifier le font du texte
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'Vous avez obtenu \n\ un nouveau badge !',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,

                        /// specifier le taille du texte
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Gotham'),

                    /// specifier le font du texte
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
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/Badges/$planeteNAME2.png'), //l'image du badge obtenu
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        '$planeteNAME',
                        style: TextStyle(
                            color: myYellow,
                            fontSize: 36,

                            /// specifier le taille du texte
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Gotham'),

                        /// specifier le font du texte
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 1),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Allez voir vos badges',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,

                            /// specifier le taille du texte
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Gotham'),

                        /// specifier le font du texte
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                          icon: Icon(Icons.arrow_forward_outlined),
                          color: Colors.white,
                          iconSize: 30,
                          onPressed: () => {
                                //// un boutton pour aller voir les badges obtenues
                                Navigator.pushReplacementNamed(
                                    context, '/profilePage'),
                              }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
