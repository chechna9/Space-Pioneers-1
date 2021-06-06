import 'package:astro01/Screens/levelChoice.dart';
import 'package:astro01/Screens/quiz.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import '../components/constants.dart';
import '../main.dart';

int etoiles;
int indices;

class BravoNiveau extends StatefulWidget {
  @override
  _BravoNiveauState createState() => _BravoNiveauState();
}

class _BravoNiveauState extends State<BravoNiveau> {
  @override
  Widget build(BuildContext context) {
    if (ableToBadge == true && etoiles == 100) {
      List<String> badges = user.badges.split("");

      badges[indices] = '1';

      user.badges = badges.join("");

      update_badges();
      /* print(user.badges);
      user.badges.replaceRange(planeteInd, planeteInd + 1, '1');
      print(user.badges);
      */
    }
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
                if (ableToBadge == true && etoiles == 100) {
                  /*  List<String> badges = user.badges.split("");
                  badges[planeteInd] = '1';
                  user.badges = badges.join("");
                  print(user.badges);*/

                  //user.badges.replaceRange(planeteInd, planeteInd, '1');
                  //print(user.badges);
                  // update_badges();
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
              child: Text(
                'Vous avez collecté \n\ $etoiles etoiles!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Gotham'),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Image(
                image: AssetImage('assets/images/avatars/rocket_badge.png'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Allez voir votre profil',
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
                              context, '/profilePage')
                        }),
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
