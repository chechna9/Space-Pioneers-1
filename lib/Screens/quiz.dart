// import 'dart:js';

// import 'dart:js';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';

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
// Future fetchQuestions() async {

// }

@override
  Widget build(BuildContext context) {
    
    return Stack(
          fit: StackFit.expand,
          children: [
            Container(
                decoration: BoxDecoration(
                gradient: myGradiant,),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
          //         body: ListView.builder(
          // itemBuilder: (context, index) {
          //   return Card(child: Column(
          //     children: [
          //       Text('Nom'),
          //       Text('Prenom'),
          //     ],
          //   ),);
          // },
          // itemCount: 4,
          // ),
                  body: AppbarCustomed(myBlue: myBlue, myRed2: myRed2),
                ),
             ),
            //  Column QuestBox(
            //     quest: "cv chwia ?",
            //     ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int myindex) {
                        return Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               AnswerBox(
                                 answer: 'cv pas $myindex',
                                 answerLetter: '$myindex',
                               ),
                             ],
                        );
                    },
                  // QuestBox(),
                  // AnswerBoxA(),
                  // AnswerBoxB(),
                  // AnswerBoxC(),
                  // AnswerBoxD(),
        ),
        ),
      ],
    );
}}





class AnswerBox extends StatelessWidget {
  final String answer;
  final String answerLetter;
  AnswerBox({
    Key key,
    this.answer : 'answer',
    this.answerLetter : 'A',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
    Padding(
    padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
       child: SizedBox(
         width: double.infinity,
         height: 69,
         child: TextButton(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 15),
                child: Container(
                  width: 41,
                  height: 41,
                decoration: BoxDecoration(
                color: myRed2,
                shape: BoxShape.circle,),
                child: Center(
                  child: Text('$answerLetter', 
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,),),
                ),),
              ),
                Text(
                   '$answer',
                    style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,),
                    ),
            ],
          ),
              style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
          ),
                onPressed: () => Navigator.pushNamed(context, '/'),),
       ),
     ),
     ],
    );
  }
}


// class AnswerBoxB extends StatelessWidget {
//   const AnswerBoxB({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//      children: [
//      Padding(
//        padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
//         child: SizedBox(
//          width: double.infinity,
//          height: 69,
//          child: TextButton(
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 15),
//                 child: Container(
//                   width: 41,
//                   height: 41,
//                 decoration: BoxDecoration(
//                 color: myRed2,
//                 shape: BoxShape.circle,),
//                 child: Center(
//                   child: Text('B', 
//                       style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 20,),),
//                 ),),
//               ),
//                 Text(
//                    'Lune',
//                     style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 20,),
//                     ),
//             ],
//           ),
//               style: TextButton.styleFrom(
//               backgroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),

//             ),
//           ),
//                 onPressed: () => Navigator.pushNamed(context, '/'),),
//        ),
//      ),
//      ],
//     );
//   }
// }


// class AnswerBoxC extends StatelessWidget {
//   const AnswerBoxC({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//      children: [
//      Padding(
//        padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
//        child: SizedBox(
//          width: double.infinity,
//          height: 69,
//          child: TextButton(
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 15),
//                 child: Container(
//                   width: 41,
//                   height: 41,
//                 decoration: BoxDecoration(
//                 color: myRed2,
//                 shape: BoxShape.circle,),
//                 child: Center(
//                   child: Text('C', 
//                       style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 20,),),
//                 ),),
//               ),
//                 Text(
//                    'Etoile',
//                     style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 20,),
//                     ),
//             ],
//           ),
//               style: TextButton.styleFrom(
//               backgroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),

//             ),
//           ),
//                 onPressed: () => Navigator.pushNamed(context, '/'),),
//        ),
//      ),
//      ],
//     );
//   }
// }


// class AnswerBoxD extends StatelessWidget {
//   const AnswerBoxD({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//      children: [
//      Padding(
//        padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
//        child: SizedBox(
//          width: double.infinity,
//          height: 69,
//          child: TextButton(
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 15),
//                 child: Container(
//                   width: 41,
//                   height: 41,
//                 decoration: BoxDecoration(
//                 color: myRed2,
//                 shape: BoxShape.circle,),
//                 child: Center(
//                   child: Text('D', 
//                       style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 20,),),
//                 ),),
//               ),
//                 Text(
//                    "Boule d'energie",
//                     style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 20,),
//                     ),
//             ],
//           ),
//               style: TextButton.styleFrom(
//               backgroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),

//             ),
//           ),
//                 onPressed: () => Navigator.pushNamed(context, '/'),),
//        ),
//      ),
//      ],
//     );
//   }
// }

class QuestBox extends StatelessWidget {
  const QuestBox({
    this.quest : 'Quelle est la couleur du Soleil',
    Key key,
  }) : super(key: key);

final String quest;
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
       padding: const EdgeInsets.only(left: 20, right: 20),
      child: 
      SizedBox(
          width: double.infinity,
          height: 100,
          child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: myRed2,
          child: Center(
            child: Text(
         '$quest',
            style: TextStyle(
            fontFamily: 'Gotham',
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            ),
            maxLines: 1,),
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
    this.planete : 'Soleil',
    this.numero : 5,
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
              height:58,
              child: Column(
                children: <Widget>[
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Spacer(flex: 2),
                  Text('$numero/10', textAlign: TextAlign.start,
                  style: TextStyle(
                  color: myRed2,
                  fontSize: 13,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.normal,
                  ),),
                  Spacer(flex: 5),
                  Text("$planete", textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.normal,
                  ),),
                  Spacer(flex: 5),
                  IconButton(icon: Icon(Icons.clear), color: myRed2, iconSize: 20, onPressed: () => Navigator.of(context).pop(true),),
                   ],),
              ]
              ),
            ),
          ),
          bottom: PreferredSize(
          preferredSize: Size.fromRadius(6),
          child: ProgressBar(width: (MediaQuery.of(context).size.width) * 0.98,)),
          ),
      ],
    );
  }
}

class ProgressBar extends StatelessWidget{
final double width;
// final int value;
// final int totalValue;

ProgressBar({this.width});

@override 
Widget build(BuildContext context) {


return Row(
 mainAxisAlignment: MainAxisAlignment.center,
 children: <Widget>[
   SizedBox(width: 5,),
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
            duration: Duration(milliseconds: 500  ),
            decoration: BoxDecoration(color: myRed2,borderRadius: BorderRadius.only( topRight: Radius.circular(5),bottomRight: Radius.circular(5),),),
            ),
],
        ),
      ],
    ),
  ],
   );
 }
}