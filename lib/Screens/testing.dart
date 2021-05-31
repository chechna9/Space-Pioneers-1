import 'package:astro01/Screens/splashScreen.dart';
import 'package:astro01/components/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/RoundedCard.dart';

class User {
  User({this.dateNessance, this.email, this.password, this.userName});
  String userName;
  String password;
  String email;
  int dateNessance;
}

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  List<String> infos = [
    "le soleil brille depuis environ 4,5 milliards d'années les étoiles comme notre soleil brûlent pendant environ 10 milliards d'années . Notre soleil est donc à la moitié de sa vie, mais ne vous inquiétez pas, il lui reste encore 5 milliards d'années à vivre .",
    "La température à la surface du soleil varie entre 8500 degrés Celsius au plus profond de la photosphère et atteint 4200 degrés Celsius à la surface de la photosphère. La température du centre du soleil est environ de 15 000 000 degrés Celsius."
  ];

  int ind = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: Text(
            "Show Dialog",
          ),
          onPressed: () {
            showDialog(
              //barrierColor: myBlue,
              context: context,
              builder: (_) => InfoSup(
                content: infos[ind],
                recomp: ind + 2,
              ),
            );
            ind++;
            ind %= 2;
          },
        ),
        backgroundColor: Colors.grey[900],
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
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
                ]))));
  }
}

class InfoSup extends StatelessWidget {
  final String content;
  final int recomp;
  InfoSup({@required this.content, @required this.recomp});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: myRed,
      title: Center(
        child: Text(
          "Saviez-vous?",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            content,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "+$recomp",
                style: TextStyle(
                  color: myYellow,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
              Column(
                children: [
                  Star(
                    scale: 2.2,
                    angle: 4,
                  ),
                  SizedBox(
                    height: 4,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: BorderSide(color: myBlue, width: 3),
      ),
    );
  }
}
