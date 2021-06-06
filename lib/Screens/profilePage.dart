import 'dart:async';
import 'dart:math';

import 'package:astro01/components/RoundedCard.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:provider/provider.dart';
import '../components/constants.dart';
import '../variable_globale/variable.dart';

String avatar = user.avatar;
String userName = user.name;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> photoList = <String>[
    'ridingRocket',
    'ridingMoon',
    'ridingRocket',
  ];

  List<BadgeCard> remplireBadge() {
    List<BadgeCard> allBadges = <BadgeCard>[
      BadgeCard(name: "Soleil hero"),
      BadgeCard(name: "Mercure hero"),
      BadgeCard(name: "Venus hero"),
      BadgeCard(name: "Terre hero"),
      BadgeCard(name: "Mars hero"),
      BadgeCard(name: "Jupiter hero"),
      BadgeCard(name: "Saturn hero"),
      BadgeCard(name: "Uranus hero"),
      BadgeCard(name: "Neptune hero"),
    ];
    List<BadgeCard> tempBadges = [];

    int i = 0;
    for (BadgeCard badge in allBadges) {
      //10 is the number of questions
      //user.badges = "110100001"; //for testing
      user.badges[i] != '0' ? tempBadges.add(badge) : null;
      i++;
    }
    return tempBadges;
  }

  @override
  Widget build(BuildContext context) {
    List<BadgeCard> userBagdes = remplireBadge();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Row(
          children: [
            SizedBox(
              width: 0,
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_outlined),
              color: myRed,
              iconSize: 35,
              onPressed: () {
                print("Go back");
                Navigator.pop(context);
              },
            ),
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
        leadingWidth: 150,
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
                      radius: 100,
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/avatarPage');
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
              userBagdes.length == 0
                  ? RoundedCard(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: AutoSizeText(
                          "Vous avez aucun badge!",
                          maxFontSize: 30,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      color: myRed,
                    )
                  : Expanded(
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
    );
  }
}

class BadgeCard extends StatelessWidget {
  final String name;
  final String date;
  final String photo;

  BadgeCard({
    Key key,
    this.name: "loading",
    this.photo: "default",
    this.date: "01-01-2020",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: myRed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                        image: AssetImage('assets/images/avatars/default.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                AutoSizeText(
                  '$name',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
            AutoSizeText(
              '$date',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 10,
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
