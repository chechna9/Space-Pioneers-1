import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          color: myRed,
          iconSize: 35,
          onPressed: () {
            print("Go back");
          },
        ),
        leadingWidth: 70,
      ),
      backgroundColor: myBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AutoSizeText(
                'Classement',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClassementCard extends StatelessWidget {
  final String name;
  final int point;
  final String photo;
  final int rank;
  ClassementCard({
    Key key,
    this.name: "loading",
    this.photo: "default",
    this.point: 0,
    this.rank: 0,
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: myYellow,
                      width: 3,
                    ),
                  ),
                  child: CircleAvatar(
                    foregroundColor: myYellow,
                    backgroundImage:
                        AssetImage('assets/images/avatars/$photo.png'),
                    radius: 25,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '$name',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      '$point pts',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AutoSizeText(
              '#$rank',
              style: TextStyle(
                color: myYellow,
                fontWeight: FontWeight.w500,
                fontSize: 40,
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
