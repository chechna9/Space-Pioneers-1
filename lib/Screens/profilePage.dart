import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_border.dart';
import '../components/constants.dart';

String avatar = "default";
String userName = "User Name";

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
  int credit = 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Row(
          children: [
            SizedBox(
              width: 0,
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              color: myRed,
              iconSize: 30,
              onPressed: () {
                print("shop");
                Navigator.pushNamed(context, '/shopPage');
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
                '$credit',
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
            icon: Icon(Icons.leaderboard_outlined),
            color: myRed,
            iconSize: 30,
            onPressed: () {
              print("LeaderBoard");
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
                      backgroundImage:
                          AssetImage('assets/images/avatars/$avatar.png'),
                      radius: 100,
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {
                        print("Options");

                        Navigator.pushNamed(context, '/avatarPage');
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
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int ind) {
                    return Column(
                      children: [
                        BadgeCard(
                          name: "Badge $ind",
                          photo: photoList[ind % 3],
                          date: "${ind % 31}-${ind % 13}-${ind % 2 + 2020}",
                        ),
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