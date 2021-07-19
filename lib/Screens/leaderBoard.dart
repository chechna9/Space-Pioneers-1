import 'dart:math';
import 'package:astro01/Screens/loading.dart';
import 'package:astro01/classes/User.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'package:injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase/supabase.dart';
// page de classement

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  Future<void> _getseremail() async {
    // lire l'email de l'utilisateur a partir du local
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      user.email = (prefs.getString('email') ?? null);
    });
    /*setState(() {
    final email = prefs.getString('email') ?? null;
    print('amail');
    print(email);
    user.email = email;
  });*/
  }

  @override
  void initState() {
    super.initState();
    _getseremail();
  }

  @override
  Widget build(BuildContext context) {
    bool existe = false;
    int ind = 0;

    // List<Users> list;
    return Scaffold(
        backgroundColor: Colors.blue,
        body: FutureBuilder<List<Users>>(
            future: getleaders(),

            /// pour selectiones les utilisateures dans l'ordre croissant par rapport au nombre d'etoiles colletctées
            builder: (context, AsyncSnapshot<List<Users>> snapshot) {
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
                      // un boutton pour retourner en arriére
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
                              String nameuser;
                              if (snapshot.data[ind].email == user.email) {
                                nameuser =
                                    "${snapshot.data[ind].name} ( vous )";
                              } else {
                                nameuser = snapshot.data[ind].name;
                              }
                              return Column(
                                children: [
                                  ClassementCard(
                                    name: nameuser,
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
                                // si l'utilisateures n'est pas classer parmis les 10 premiers son classement sera afficher au dessous de la page (fixé)
                                rank:
                                    leaders(user.email, snapshot.data, ind) + 1,
                                name: "${user.name} ( vous )",
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: AutoSizeText(
                        '$name',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      '$point pts',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: AutoSizeText(
                '#$rank',
                maxLines: 1,
                style: TextStyle(
                  color: myYellow,
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                ),
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
  // une fonction pour recuperer les utilisateures de la base de données ordonnées selon le nombre d'étoiles colléctées par chaque utilisateur
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
  // pou recuperer le classement de l'utilisateur actuelle
  bool trouv = false;
  int i = 0;

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
