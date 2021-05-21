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

Future fetchQuestions() async {

}


@override
  Widget build(BuildContext context) {
    
    return Stack(
          fit: StackFit.expand,
          children: [
            Container(
                decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
                colors: [
                myBlue,
                Color(0xff50012d), ], ), ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body:  AppbarCustomed(myBlue: myBlue, myRed2: myRed2),
                ),
             ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  QuestBox(),
                  AnswerBoxA(),
                  AnswerBoxB(),
                  AnswerBoxC(),
                  AnswerBoxD(),
          ],
        ),
                ),
      ],
    );
}}





class AnswerBoxA extends StatelessWidget {
  const AnswerBoxA({
    Key key,
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
                  child: Text('A', 
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,),),
                ),),
              ),
                Text(
                   'Planète',
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


class AnswerBoxB extends StatelessWidget {
  const AnswerBoxB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
     Padding(
       padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
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
                  child: Text('B', 
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,),),
                ),),
              ),
                Text(
                   'Lune',
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


class AnswerBoxC extends StatelessWidget {
  const AnswerBoxC({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
     Padding(
       padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
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
                  child: Text('C', 
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,),),
                ),),
              ),
                Text(
                   'Etoile',
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


class AnswerBoxD extends StatelessWidget {
  const AnswerBoxD({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
     Padding(
       padding: const EdgeInsets.only(top: 18, left: 20, right: 20),
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
                  child: Text('D', 
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,),),
                ),),
              ),
                Text(
                   "Boule d'energie",
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

class QuestBox extends StatelessWidget {
  const QuestBox({
    Key key,
  }) : super(key: key);

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
         'Le soleil est une ....',
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
  }) : super(key: key);

  final Color myBlue;
  final Color myRed2;

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
                  Text('2/10', textAlign: TextAlign.start,
                  style: TextStyle(
                  color: myRed2,
                  fontSize: 13,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.normal,
                  ),),
                  Spacer(flex: 5),
                  Text("Soleil", textAlign: TextAlign.center,
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