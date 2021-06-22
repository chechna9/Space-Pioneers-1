// import 'dart:js';
import 'dart:math';
import 'dart:io';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:astro01/Screens/bravoNiveauR.dart';
import 'package:astro01/Screens/loading.dart';
import 'package:astro01/Screens/quiz.dart';
import 'package:astro01/classes/random.dart';
import 'package:astro01/main.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:astro01/variable_globale/variable.dart';
import 'package:provider/provider.dart';

bool vfquestion;
List<String> propo = ['a', 'b', 'c', 'd'];
var ind = Iterable<int>.generate(100).toList();

int points = 0;
bool cliquerRandom = false;
AssetsAudioPlayer wrongRandAnswerPlayer = AssetsAudioPlayer();
AssetsAudioPlayer rightRandAnswerPlayer = AssetsAudioPlayer();
int questNumRandom = 1;
List<int> indices = [0, 1, 2, 3];

class Index extends ChangeNotifier {
  var ind = Iterable<int>.generate(100).toList();

  int nb = nbTentatives;

  void updateInd(List<int> newindice, int num) {
    ind = newindice;
    nb = num;
    notifyListeners();
  }
}

class RandomQuiz extends StatefulWidget {
  @override
  final int indice;

  RandomQuiz({Key key, this.indice}) : super(key: key);
  _RandomQuizState createState() => _RandomQuizState();
}

class _RandomQuizState extends State<RandomQuiz> {
  List<Aleatoire> _randoms = <Aleatoire>[];
  Future<List<Aleatoire>> fetchRandoms() async {
    var url = Uri.parse('https://nadir-ogd.github.io/Random-API/random.json');
    var response = await http.get(url);

// ignore: deprecated_member_use
    var randoms = List<Aleatoire>();
    if (response.statusCode == 200) {
      var randomsJson = json.decode(response.body);
      for (var randomsJson in randomsJson) {
        randoms.add(Aleatoire.fromJson(randomsJson));
      }
    }
    return randoms;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Index>(
        create: (context) => Index(),
        child: Scaffold(
            backgroundColor: Colors.blue,
            body: FutureBuilder<List<Aleatoire>>(
                future: fetchRandoms(),
                builder: (context, AsyncSnapshot<List<Aleatoire>> snapshot) {
                  if (snapshot.hasData == false) {
                    return LoadingScreen();
                  }

                  ind = Provider.of<Index>(context).ind;
                  if (cliquerRandom == false) {
                    if (vfquestion == false) indices = [0, 1, 2, 3];
                    indices = shuffle(indices);
                    ind = shuffle(ind);
                  }

                  RemplirChoices(propo, snapshot.data[ind[0]]);
                  int i = 4;
                  if (propo[2] == null && propo[1] == null) {
                    i = 2;
                    if (cliquerRandom == false) indices = shuffle([0, 3]);
                    vfquestion = true;
                  }
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: myGradiant,
                        ),
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                          body: AppbarCustomedRandom(
                            myBlue: myBlue,
                            myRed2: myRed2,
                            numero: questNumRandom,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 160),
                        child: Column(children: [
                          QuestBoxRandom(
                            quest: snapshot.data[ind[0]].question,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: min(i, 4),
                              itemBuilder: (BuildContext context, int myindex) {
                                return Column(children: [
                                  AnswerBoxRandom(
                                    answer: propo[indices[myindex]],
                                    answerLetter: '${myindex + 1}',
                                  ),
                                ]);
                              },
                            ),
                          ),
                        ]),
                      ),
                    ],
                  );
                })));
  }
}

class AnswerBoxRandom extends StatefulWidget {
  final String answer;
  final String answerLetter;
  AnswerBoxRandom({
    Key key,
    this.answer: 'answer',
    this.answerLetter: 'A',
  }) : super(key: key);

  @override
  _AnswerBoxRandomState createState() => _AnswerBoxRandomState();
}

class _AnswerBoxRandomState extends State<AnswerBoxRandom> {
  void playRandRightMusic() async {
    rightRandAnswerPlayer.open(
      Audio(
        rightMusicPath,
      ),
      autoStart: true,
      playInBackground: PlayInBackground.disabledRestoreOnForeground,
    );
  }

  void playRandWrongMusic() async {
    rightRandAnswerPlayer.open(
      Audio(
        wrongMusicPath,
      ),
      autoStart: true,
      playInBackground: PlayInBackground.disabledRestoreOnForeground,
    );
  }

  Color choiceColor = Colors.white;
  List<Color> choiceColors = [choiceGreen, choiceRed, choiceYellow, choiceBlue];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
          child: Container(
            width: double.infinity,
            height: 69,
            decoration: BoxDecoration(
              color: choiceColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: ListTile(
                onTap: () {
                  if (widget.answer == propo[0]) {
                    setState(() {
                      playRandRightMusic();
                      if (cliquerRandom == false) {
                        points += factRecomp;
                      }
                      choiceColor = choiceColors[0];
                      questNumRandom++;
                      vfquestion = false;
                    });
                    ind.removeAt(0);
                    cliquerRandom = false;
                  } else if (widget.answer == propo[1]) {
                    setState(() {
                      playRandWrongMusic();
                      cliquerRandom = true;
                      choiceColor = choiceColors[1];
                      nbTentatives--;
                      Provider.of<Index>(context, listen: false)
                          .updateInd(ind, nbTentatives);
                    });
                  } else if (widget.answer == propo[2]) {
                    setState(() {
                      playRandWrongMusic();
                      cliquerRandom = true;
                      choiceColor = choiceColors[2];
                      nbTentatives--;
                      Provider.of<Index>(context, listen: false)
                          .updateInd(ind, nbTentatives);
                    });
                  } else if (widget.answer == propo[3]) {
                    setState(() {
                      playRandWrongMusic();
                      cliquerRandom = true;
                      choiceColor = choiceColors[3];
                      nbTentatives--;
                      Provider.of<Index>(context, listen: false)
                          .updateInd(ind, nbTentatives);
                    });
                  }
                  Timer(Duration(milliseconds: 600), () {
                    setState(() {
                      choiceColor = Colors.white;
                    });
                  });
                  Timer(Duration(milliseconds: 700), () {
                    if (ind.isEmpty || nbTentatives <= 0) {
                      questNumRandom = 1;
                      user.etoiles = user.etoiles + points;
                      update_etoiles();
                      etoilesRandom = points;
                      points = 0;
                      planeteName = "Random";
                      Navigator.pushReplacementNamed(context, '/bravoNiveauR');
                    } else {
                      if (widget.answer == propo[0]) {
                        setState(() {
                          Provider.of<Index>(context, listen: false)
                              .updateInd(ind, nbTentatives);
                        });
                      }
                    }
                  });
                },
                selectedTileColor: choiceColor,
                leading: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, bottom: 8, right: 15),
                  child: Container(
                    width: 41,
                    height: 41,
                    decoration: BoxDecoration(
                      color: myRed2,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${widget.answerLetter}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  '${widget.answer}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

// int verifRandom(int point) {
//   if (planeteInd == 9) {
//     int pointsRandom = user.etoiles - (trace.earth + trace.jupiter + trace.mars + trace.mercury + trace.neptune + trace.saturn + trace.soleil + trace.uranus + trace.venus);
//     if (pointsRandom < points) {
//       difference = points - pointsRandom;
//       print("difference");
//       print(difference);
//       pointsRandom = points;
//       etoilesMax = points;
//       return 1;
//     } else {
//       difference = 0;
//       etoilesMax = pointsRandom;
//       return -1;
//     }
//   }
// }

class QuestBoxRandom extends StatelessWidget {
  const QuestBoxRandom({
    this.quest: '',
    Key key,
  }) : super(key: key);

  final String quest;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: myRed2,
          child: Center(
            child: Text(
              '$quest',
              style: TextStyle(
                fontFamily: 'Gotham',
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 19,
              ),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class AppbarCustomedRandom extends StatelessWidget {
  const AppbarCustomedRandom({
    Key key,
    @required this.myBlue,
    @required this.myRed2,
    this.numero: 5,
  }) : super(key: key);

  final Color myBlue;
  final Color myRed2;
  final int numero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 91,
          elevation: 20,
          title: Container(
            clipBehavior: Clip.none,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'random',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '$numero/100',
                  style: TextStyle(
                    color: myRed2,
                    fontSize: 17,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          leadingWidth: 70,
          leading: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(children: [
                Text(
                  '${Provider.of<Index>(context).nb}',
                  style: TextStyle(
                    color: myRed2,
                    fontSize: 23,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6, top: 3),
                  child: Transform.rotate(
                    angle: 6.5,
                    child: Image.asset(
                      'assets/images/icons/fusil.png',
                      fit: BoxFit.scaleDown,
                      width: 15,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          actions: [
            Center(
              child: IconButton(
                  icon: Icon(Icons.clear),
                  color: myRed2,
                  iconSize: 30,
                  onPressed: () {
                    points = 0;
                    Navigator.pushReplacementNamed(context, '/planetChoice');
                  }),
            ),
          ],
        ));
  }
}

void RemplirChoices(List<String> choices, Aleatoire myrandom) {
  choices[0] = myrandom.correct;
  choices[1] = myrandom.choice1;
  choices[2] = myrandom.choice2;
  choices[3] = myrandom.choice3;
}

List shuffle(List<int> indices) {
  var random = new Random();

  // Go through all elements.
  for (var i = indices.length - 1; i >= 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);
    var temp = indices[i];
    indices[i] = indices[n];
    indices[n] = temp;
  }

  return indices;
}

void update_etoiles() async {
  await supabaseclient
      .from("user")
      .update({"etoiles": user.etoiles})
      .eq("email", user.email)
      .execute();
}
