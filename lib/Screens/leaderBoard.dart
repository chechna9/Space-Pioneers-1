import 'dart:math';

import 'package:astro01/Screens/loading.dart';
import 'package:astro01/classes/User.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  List<String> nameList = <String>[
    'name1',
    'name2',
    'name3',
  ];
  List<String> photoList = <String>[
    'ridingRocket',
    'ridingMoon',
    'ridingRocket',
  ];
  List<int> pointList = <int>[
    255,
    25,
    12,
  ];
  List<int> rankList = <int>[
    1,
    2,
    3,
  ];

  @override
  Widget build(BuildContext context) {
    bool existe = false;
    int ind = 0;
    // List<Users> list;
    return Scaffold(
        backgroundColor: Colors.blue,
        body: FutureBuilder<List<Users>>(
            future: getleaders(),
            builder: (context, AsyncSnapshot<List<Users>> snapshot) {
              print(user.etoiles);
              // list = snapshot.data;
              if (snapshot.hasData == false) {
                return LoadingScreen();
              }
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_outlined),
                    color: myRed,
                    iconSize: 35,
                    onPressed: () {
                      print("Go back");
                      Navigator.pop(context);
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
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: min(10, snapshot.data.length),
                            itemBuilder: (BuildContext context, ind) {
                              return Column(
                                children: [
                                  ClassementCard(
                                    name: snapshot.data[ind].name,
                                    photo: snapshot.data[ind].avatar,
                                    rank: ind + 1,
                                    point: snapshot.data[ind].etoiles,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        (leaders(user.email, snapshot.data,
                                    min(10, snapshot.data.length)) !=
                                -1)
                            ? ClassementCard(
                                rank:
                                    leaders(user.email, snapshot.data, ind) + 1,
                                name: user.name,
                                photo: user.avatar,
                                point: user.etoiles,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              );
            }));
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

Future<List<Users>> getleaders() async {
  final response = await Injector.appInstance
      .get<SupabaseClient>()
      .from('user')
      .select()
      .order('etoiles', ascending: false)
      .execute();
  final dataList = response.data as List;
  return dataList.map((map) => Users.fromJson(map)).toList();
}

int leaders(String email, List<Users> list, int indice) {
  bool trouv = false;
  int i = 0;

  print(indice);
  for (i; i != list.length; i++) {
    if (user.email == list[i].email) {
      trouv = true;
      break;
    }
  }
  if (trouv == true && i >= indice)
    return i;
  else
    return -1;
}
