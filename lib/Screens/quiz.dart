// import 'dart:js';

// import 'dart:js';

import 'package:astro01/Screens/loading.dart';
import 'package:astro01/classes/questions.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

// import 'package:http/http.dart' as http;
// import 'package:flutter/services.dart' show rootBundle;

// Future<String> getJson() {
//   return rootBundle.loadString('questions.json');
// }

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
// ignore: unused_field
  List<Question> _questions = <Question>[];

  Future<List<Question>> fetchQuestions() async {
    var url = Uri.parse('https://nadir-ogd.github.io/Quiz-API/questions.json');
    var response = await http.get(url);

// ignore: deprecated_member_use
    var questions = List<Question>();
    if (response.statusCode == 200) {
      var questionsJson = json.decode(response.body);
      for (var questionsJson in questionsJson) {
        //Question questions= Question(questionsJson['planete'], quest['quest'], quest['correct'] ,quest['choice1'] , quest['choice2'] ,emp['infosupp']);

        questions.add(Question.fromJson(questionsJson));
      }
    }
    return questions;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: FutureBuilder<List<Question>>(
            future: fetchQuestions(),
            builder: (context, AsyncSnapshot<List<Question>> snapshot) {
              if (snapshot.hasData == false) {
                return LoadingScreen();
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
                      body: AppbarCustomed(myBlue: myBlue, myRed2: myRed2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: Column(children: [
                      QuestBox(
                        quest: snapshot.data[8].question,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int myindex) {
                            var i = myindex + 1;
                            return Column(children: [
                              AnswerBox(
<<<<<<< HEAD
                                answer: snapshot.data[10].choice1,
                                answerLetter: '${myindex + 1}',
=======
                                answer: snapshot.data[8].choice1,
                                 answerLetter: '${myindex + 1}',
>>>>>>> 2fc1464c360f6ee0e6d42c3c6dd89485de2b0099
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

class AnswerBox extends StatefulWidget {
  final String answer;
  final String answerLetter;
  AnswerBox({
    Key key,
    this.answer: 'answer',
    this.answerLetter: 'A',
  }) : super(key: key);

  @override
  _AnswerBoxState createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  Color choiceColor = Colors.white;
  List<Color> choiceColors = [choiceBlue, choiceYellow, choiceGreen, choiceRed]; 
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
                onTap: () { setState(() {
                  choiceColor= Colors.orange;
                  // print("object");
                 });},
                selectedTileColor: choiceColor,
                leading: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 15),
                      child: Container(
                      width: 41,
                      height: 41,
                      decoration: BoxDecoration(
                      color: myRed2,
                      shape: BoxShape.circle,),
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
        // Padding(
        //   padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
        //   child: SizedBox(
        //     width: double.infinity,
        //     height: 69,
        //     child: TextButton(
        //       child: Row(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(
        //                 top: 8, left: 8, bottom: 8, right: 15),
        //             child: Container(
        //               width: 41,
        //               height: 41,
        //               decoration: BoxDecoration(
        //                 color: myRed2,
        //                 shape: BoxShape.circle,
        //               ),
        //               child: Center(
        //                 child: Text(
        //                   '${widget.answerLetter}',
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.w700,
        //                     fontSize: 20,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //           Text(
        //             '${widget.answer}',
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontWeight: FontWeight.w700,
        //               fontSize: MediaQuery.of(context).size.width/29,
        //             ),
        //             maxLines: 3,
        //           ),
        //         ],
        //       ),
        //       style: TextButton.styleFrom(
        //         backgroundColor: Colors.white,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //       ),
        //       onPressed: () => Navigator.pushNamed(context, '/'),
        //     ),
        //   ),
        // ),
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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: myBlue,
          pinned: true,
          expandedHeight: 91,
          brightness: Brightness.dark,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            centerTitle: true,
            title: SizedBox(
              height: 58,
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(flex: 2),
                    Text(
                      '$numero/10',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: myRed2,
                        fontSize: 13,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Spacer(flex: 5),
                    Text(
                      "$planete",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Spacer(flex: 5),
                    IconButton(
                      icon: Icon(Icons.clear),
                      color: myRed2,
                      iconSize: 20,
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                ),
              ]),
            ),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromRadius(6),
              child: ProgressBar(
                width: (MediaQuery.of(context).size.width) * 0.98,
              )),
        ),
      ],
    );
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
