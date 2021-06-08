// import 'dart:js';

// import 'dart:js';

import 'dart:math';
import 'dart:io';

import 'package:astro01/Screens/bravoNiveau.dart';
import 'package:astro01/Screens/bravoNiveauR.dart';
import 'package:astro01/Screens/loading.dart';
import 'package:astro01/Screens/planetChoice.dart';
import 'package:astro01/classes/questions.dart';
import 'package:astro01/components/InfoSup.dart';
import 'package:astro01/main.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:astro01/variable_globale/variable.dart';
import 'package:provider/provider.dart';
import '../components/InfoSup.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/services.dart' show rootBundle;

// Future<String> getJson() {
//   return rootBundle.loadString('questions.json');
// }
bool vfquestion;
String planeteName;
List<String> propo = ['a', 'b', 'c', 'd'];
int points = 0;
bool cliquer = false;
List<int> ind = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
List<int> indices = [0, 1, 2, 3];

class Ind extends ChangeNotifier {
  List<int> ind = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  int nb = nbTentatives;

  void updateInd(List<int> newindice, int num) {
    ind = newindice;
    nb = num;
    notifyListeners();
  }
}

int questNum = 1;

class Quiz extends StatefulWidget {
  @override
  final int indice;

  Quiz({Key key, this.indice}) : super(key: key);
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Question> _questions = <Question>[];
  Future<List<Question>> fetchQuestions() async {
    var url = Uri.parse('https://nadir-ogd.github.io/Quiz-API/questions.json');
    var response = await http.get(url);

// ignore: deprecated_member_use
    var questions = List<Question>();
    if (response.statusCode == 200) {
      var questionsJson = json.decode(response.body);
      for (var questionsJson in questionsJson) {
        questions.add(Question.fromJson(questionsJson));
      }
    }
    return questions;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Ind>(
        create: (context) => Ind(),
        child: Scaffold(
            backgroundColor: Colors.blue,
            body: FutureBuilder<List<Question>>(
                future: fetchQuestions(),
                builder: (context, AsyncSnapshot<List<Question>> snapshot) {
                  if (snapshot.hasData == false) {
                    return LoadingScreen();
                  }

                  ind = Provider.of<Ind>(context).ind;

                  if (cliquer == false) {
                    if (vfquestion == false) indices = [0, 1, 2, 3];
                    indices = shuffle(indices);
                    ind = shuffle(ind);
                  }
                  RemplirChoices(
                      propo, snapshot.data[ind[0] + 10 * planeteInd]);
                  print(propo);

                  planeteName = snapshot.data[ind[0] + 10 * planeteInd].planete;

                  int i = 4;

                  if (propo[2] == null && propo[1] == null) {
                    i = 2;
                    if (cliquer == false) indices = shuffle([0, 3]);
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
                          body: AppbarCustomed(
                            myBlue: myBlue,
                            myRed2: myRed2,
                            planete:
                                planeteName.inCaps,
                            numero: questNum,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 160),
                        child: Column(children: [
                          QuestBox(
                            quest: snapshot
                                .data[ind[0] + 10 * planeteInd].question,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: min(4, i),
                              itemBuilder: (BuildContext context, int myindex) {
                                print(indices);
                                return Column(children: [
                                  AnswerBox(
                                    answer: propo[indices[myindex]],
                                    answerLetter: '${myindex + 1}',
                                    infoSup: snapshot
                                        .data[ind[0] + 10 * planeteInd]
                                        .infosupp,
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

class AnswerBox extends StatefulWidget {
  final String answer;
  final String answerLetter;
  final String infoSup;
  AnswerBox({
    Key key,
    this.answer: 'answer',
    this.answerLetter: 'A',
    this.infoSup,
  }) : super(key: key);

  @override
  _AnswerBoxState createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  bool recompCliquer = false;

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
                  recompCliquer = cliquer;

                  if (widget.answer == propo[0]) {
                    setState(() {
                      if (cliquer == false) {
                        points += factRecomp;
                      }
                      choiceColor = choiceColors[0];
                      questNum++;
                      print("points :");
                      print(points);

                      showDialog(
                        barrierDismissible: ind.length != 1,
                        context: context,
                        builder: (context) => InfoSup(
                          content: widget.infoSup,
                          recomp: recompCliquer ? 0 : factRecomp,
                          onPressedExiste: ind.length == 0,
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/bravoNiveau');
                          },
                        ),
                      );

                      ind.removeAt(0);
                      vfquestion = false;
                      cliquer = false;
                    });
                  } else if (widget.answer == propo[1])
                    setState(() {
                      cliquer = true;
                      choiceColor = choiceColors[1];
                      nbTentatives--;
                      Provider.of<Ind>(context, listen: false)
                          .updateInd(ind, nbTentatives);
                      print("points :");
                      print(points);
                    });
                  else if (widget.answer == propo[2])
                    setState(() {
                      cliquer = true;
                      choiceColor = choiceColors[2];
                      nbTentatives--;
                      Provider.of<Ind>(context, listen: false)
                          .updateInd(ind, nbTentatives);
                      print("points :");
                      print(points);
                    });
                  else if (widget.answer == propo[3]) {
                    setState(() {
                      cliquer = true;
                      choiceColor = choiceColors[3];
                      nbTentatives--;
                      Provider.of<Ind>(context, listen: false)
                          .updateInd(ind, nbTentatives);
                      print("points :");
                      print(points);
                    });
                  }

                  Timer(Duration(milliseconds: 600), () {
                    setState(() {
                      choiceColor = Colors.white;
                    });
                  });

                  Timer(Duration(seconds: 1), () {
                    if (ind.isEmpty || nbTentatives <= 0) {
                      if (verification(points) == 1) {
                        update();

                        user.etoiles = trace.earth +
                            trace.jupiter +
                            trace.mars +
                            trace.mercury +
                            trace.neptune +
                            trace.saturn +
                            trace.soleil +
                            trace.uranus +
                            trace.venus;
                      }

                      etoiles = points;
                      print(points);
                      if (nbTentatives <= 0) {
                        Navigator.pushReplacementNamed(context, '/bravoNiveau');
                      }
                      indicesbravo = planeteInd;
                      //Navigator.pushReplacementNamed(context, '/planetChoice');
                      questNum = 1;
                      points = 0;
                    } else {
                      if (widget.answer == propo[0]) {
                        setState(() {
                          Provider.of<Ind>(context, listen: false)
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

class QuestBox extends StatelessWidget {
  const QuestBox({
    this.quest: 'Quelle est la couleur du Soleil',
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

class AppbarCustomed extends StatelessWidget {
  const AppbarCustomed({
    Key key,
    @required this.myBlue,
    @required this.myRed2,
    this.planete: 'Soleil',
    this.numero: 5,
  }) : super(key: key);

  final Color myBlue;
  final Color myRed2;
  final String planete;
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
                  '$planete',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Gotham',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  '$numero/10',
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
                  '${Provider.of<Ind>(context).nb}',
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

class ProgressBar extends StatelessWidget {
  final double width;
// final int value;
// final int totalValue;

  ProgressBar({this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 5,
        ),
        Stack(
          children: <Widget>[
            Container(
              width: width,
              height: 8,
              decoration: BoxDecoration(color: myBlue),
            ),
            Row(
              children: [
                AnimatedContainer(
                  height: 8,
                  width: width,
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: myRed2,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

void RemplirChoices(List<String> choices, Question myquestion) {
  choices[0] = myquestion.correct;
  choices[1] = myquestion.choice1;
  choices[2] = myquestion.choice2;
  choices[3] = myquestion.choice3;
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

int verification(int point) {
  if (planeteInd == 0) {
    if (trace.soleil < point) {
      difference = point - trace.soleil;
      print("difference");
      print(difference);
      trace.soleil = point;
      etoilesMax = point;
      return 1;
    } else {
      difference = 0;
      etoilesMax = trace.soleil;
      return -1;
    }
  }
  if (planeteInd == 1) {
    if (trace.mercury < point) {
      difference = point - trace.mercury;
      print("difference");
      print(difference);
      trace.mercury = point;
      etoilesMax = point;
      return 1;
    } else {
      difference = 0;
      etoilesMax = trace.mercury;
      return -1;
    }
  }
  if (planeteInd == 2) {
    if (trace.venus < point) {
      difference = point - trace.venus;
      print("difference");
      print(difference);
      trace.venus = point;
      etoilesMax = point;
      return 1;
    } else {
      difference = 0;
      etoilesMax = trace.venus;
      return -1;
    }
  }
  if (planeteInd == 3) {
    if (trace.earth < point) {
      difference = point - trace.earth;
      print("difference");
      print(difference);
      trace.earth = point;
      etoilesMax = point;
      return 1;
    } else {
      difference = 0;
      etoilesMax = trace.earth;
      return -1;
    }
  }
  if (planeteInd == 4) {
    if (trace.mars < point) {
      difference = point - trace.mars;
      print("difference");
      print(difference);
      trace.mars = point;
      etoilesMax = point;
      return 1;
    } else {
      difference = 0;
      etoilesMax = trace.mars;
      return -1;
    }
  }
  if (planeteInd == 5) {
    if (trace.jupiter < point) {
      difference = point - trace.jupiter;
      print("difference");
      print(difference);
      trace.jupiter = point;
      etoilesMax = point;
      return 1;
    } else {
      difference = 0;
      etoilesMax = trace.jupiter;
      return -1;
    }
  }
  if (planeteInd == 6) {
    if (trace.saturn < point) {
      difference = point - trace.saturn;
      print("difference");
      print(difference);
      trace.saturn = point;
      etoilesMax = point;
      return 1;
    } else {
      difference = 0;
      etoilesMax = trace.saturn;
      return -1;
    }
  }
  if (planeteInd == 7) {
    if (trace.uranus < point) {
      difference = point - trace.uranus;
      print("difference");
      print(difference);
      trace.uranus = point;
      etoilesMax = point;
      return 1;
    } else {
      difference = 0;
      etoilesMax = trace.uranus;
      return -1;
    }
  }
  if (planeteInd == 8) {
    if (trace.neptune < point) {
      difference = point - trace.neptune;
      print("difference");
      print(difference);
      trace.neptune = point;
      etoilesMax = point;
      return 1;
    } else {
      difference = 0;
      etoilesMax = trace.neptune;
      return -1;
    }
  }
}

void update() async {
  await supabaseclient
      .from("Trace")
      .update({
        "email": user.email,
        "jupiter": trace.jupiter,
        "earth": trace.earth,
        "venus": trace.venus,
        "soleil": trace.soleil,
        "uranus": trace.uranus,
        "saturn": trace.saturn,
        "neptune": trace.neptune,
        "mercury": trace.mercury,
        "mars": trace.mars
      })
      .eq("email", user.email)
      .execute();
  await supabaseclient
      .from("user")
      .update({
        "etoiles": trace.earth +
            trace.jupiter +
            trace.mars +
            trace.mercury +
            trace.neptune +
            trace.saturn +
            trace.soleil +
            trace.uranus +
            trace.venus,
      })
      .eq("email", user.email)
      .execute();
}
