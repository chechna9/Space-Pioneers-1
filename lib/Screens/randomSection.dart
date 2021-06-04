// import 'dart:js';
import 'dart:math';
import 'dart:io';
import 'package:astro01/Screens/loading.dart';
import 'package:astro01/Screens/planetChoice.dart';
import 'package:astro01/classes/questions.dart';
import 'package:astro01/classes/random.dart';
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

List<String> propo = ['a', 'b', 'c', 'd'];
var ind = Iterable<int>.generate(100).toList();

class Index extends ChangeNotifier {
var ind = Iterable<int>.generate(100).toList();
  void updateInd(List<int> newindice) {
    ind = newindice;
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

  int questNum = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.blue,
            body: FutureBuilder<List<Aleatoire>>(
                future: fetchRandoms(),
                builder: (context, AsyncSnapshot<List<Aleatoire>> snapshot) {
                //  if (snapshot.hasData == false) {
                //     return LoadingScreen();
                //   }
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
                            numero: questNum,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 160),
                        child: Column(children: [
                          QuestBoxRandom(
                            quest: snapshot.data[0].question,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int myindex) {
                                return Column(children: [
                                  AnswerBoxRandom(
                                    answer: "eeeee",
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
                }));
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
                // onTap: () {
                 
                // },
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

class QuestBoxRandom extends StatelessWidget {
  const QuestBoxRandom({
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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: myBlue,
          pinned: true,
          elevation: 15,
          shadowColor: Colors.black,
          expandedHeight: 91,
          brightness: Brightness.dark,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 27),
              child: Text(
                'random',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 34, left: 11),
            child: Text(
              '$numero/10',
              style: TextStyle(
                color: myRed2,
                fontSize: 17,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 17, right: 5),
              child: IconButton(
                  icon: Icon(Icons.clear),
                  color: myRed2,
                  iconSize: 30,
                  onPressed: () {
                    // points = 0;
                    Navigator.pushReplacementNamed(context, '/planetChoice');
                  }),
            ),
          ],
        ),
      ],
    );
  }
}

// class ProgressBar extends StatelessWidget {
//   final double width;
// // final int value;
// // final int totalValue;

//   ProgressBar({this.width});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         SizedBox(
//           width: 5,
//         ),
//         Stack(
//           children: <Widget>[
//             Container(
//               width: width,
//               height: 8,
//               decoration: BoxDecoration(color: myBlue),
//             ),
//             Row(
//               children: [
//                 AnimatedContainer(
//                   height: 8,
//                   width: width,
//                   duration: Duration(milliseconds: 500),
//                   decoration: BoxDecoration(
//                     color: myRed2,
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(5),
//                       bottomRight: Radius.circular(5),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

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

