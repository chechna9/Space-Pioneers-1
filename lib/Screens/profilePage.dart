import 'package:astro01/Screens/bravoNiveauR.dart';
import 'package:astro01/components/RoundedCard.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_border.dart';
import '../components/constants.dart';
import '../variable_globale/variable.dart';

String avatar = user.avatar;
String userName = user.name;
String badgePhoto;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<BadgeCard> remplireBadge() {
    List<BadgeCard> allBadges = <BadgeCard>[
      BadgeCard(
        name: "Pionnier du Soleil",
        photo: "soleil",
        color: Color(0xffFFE600),
      ),
      BadgeCard(
        name: "Pionnier de Mercure",
        photo: "mercure",
        color: Color(0xff595959),
      ),
      BadgeCard(
        name: "Pionnier de Venus",
        photo: "venus",
        color: Color(0xffDF8F13),
      ),
      BadgeCard(
        name: "Pionnier de la Terre",
        photo: "terre",
        color: Color(0xff78E237),
      ),
      BadgeCard(
        name: "Pionnier de Mars",
        photo: "mars",
        color: Color(0xffD70003),
      ),
      BadgeCard(
        name: "Pionnier de Jupiter",
        photo: "jupiter",
        color: Color(0xffEE6632),
      ),
      BadgeCard(
        name: "Pionnier de Saturne",
        photo: "saturne",
        color: Color(0xff87579E),
      ),
      BadgeCard(
        name: "Pionnier d'Uranus",
        photo: "uranus",
        color: Color(0xff1A8CA9),
      ),
      BadgeCard(
        name: "Pionnier de Neptune",
        photo: "neptune",
        color: Color(0xff37DBD0),
      ),
      BadgeCard(
        name: "Le maître de la galaxie",
        photo: "random",
        color: Color(0xffFFF16E),
      ),
      BadgeCard(
        name: "Après 5 badges",
        photo: "after5Badges",
        color: Color(0xffE1023C),
      ),
      BadgeCard(
        name: "Nouveau",
        photo: "new",
        color: Color(0xffAB02E6),
      ),
    ];
    List<BadgeCard> tempBadges = [];

    int i = 0;
    for (BadgeCard badge in allBadges) {
      //10 is the number of questions
      //user.badges = "110100001"; //for testing
      user.badges[i] != '0' ? tempBadges.add(badge) : null;
      i++;
    }
    if (tempBadges.length > 5 && user.badges[10] == '0') {
      tempBadges.add(allBadges[10]);
      List<String> badges = user.badges.split("");

      badges[10] = '1';

      user.badges = badges.join("");

      update_badges();
    }

    return tempBadges;
    //  badgePhoto = BadgeCard().photo;
    // return allBadges;
  }

  @override
  Widget build(BuildContext context) {
    List<BadgeCard> userBagdes = remplireBadge();
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/homeScreen');
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Row(
            children: [
              Transform.rotate(
                angle: 8,
                child: Image.asset(
                  'assets/images/other/star.png',
                  width: 30,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Center(
                child: Text(
                  '${user.etoiles}',
                  style: TextStyle(
                    color: myYellow,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            color: myRed,
            iconSize: 35,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/homeScreen');
            },
          ),
          leadingWidth: 45,
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              color: myRed,
              iconSize: 30,
              onPressed: () {
                Navigator.pushNamed(context, '/shopPage');
              },
            ),
            IconButton(
              icon: Icon(Icons.leaderboard_outlined),
              color: myRed,
              iconSize: 30,
              onPressed: () {
                Navigator.pushNamed(context, '/leaderBoard');
              },
            ),
          ],
        ),
        backgroundColor: myBlue,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: myRed,
                          width: 4,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/avatars/${user.avatar}.png'),
                        radius: 70,
                      ),
                    ),
                    Positioned(
                      child: IconButton(
                        icon: Icon(Icons.settings),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/avatarPage');
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                AutoSizeText(
                  userName,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: userBagdes.length,
                    itemBuilder: (BuildContext context, int ind) {
                      return Column(
                        children: [
                          userBagdes[ind],
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
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

class BadgeCard extends StatelessWidget {
  final String name;
  final String date;
  final String photo;
  final Color color;
  BadgeCard({
    Key key,
    this.name: "loading",
    this.photo: "default",
    this.date: "01-01-2020",
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(4),
              decoration: ShapeDecoration(
                color: myYellow,
                shape: PolygonBorder(sides: 6),
              ),
              child: Container(
                decoration: ShapeDecoration(
                  shape: PolygonBorder(sides: 6),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Badges/$photo.png'),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: AutoSizeText(
                '$name',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
