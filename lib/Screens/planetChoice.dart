import 'package:astro01/Screens/levelChoice.dart';
import 'package:astro01/classes/trace.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'quiz.dart';
import 'randomSection.dart';

class PlanetChoice extends StatefulWidget {
  @override
  _PlanetChoiceState createState() => _PlanetChoiceState();
}

int planeteInd;

class _PlanetChoiceState extends State<PlanetChoice> {
  int credit = 75;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/homeScreen');
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        elevation: 0,
        leadingWidth: 70,
        toolbarHeight: 70,
      ),
      backgroundColor: myBlue,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              'Choisir le quiz !',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: myRed,
                fontSize: 40,
              ),
            ),
            AutoSizeText(
              'Pour commencer l\'aventure.',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30,
                children: [
                  PlanetCard(
                    image: 'soleil',
                    title: 'soleil',
                    choiceInd: 0,
                  ),
                  PlanetCard(
                    image: 'venus',
                    title: 'venus',
                    choiceInd: 2,
                  ),
                  PlanetCard(
                    image: 'mercury',
                    title: 'mercure',
                    choiceInd: 1,
                  ),
                  PlanetCard(
                    image: 'earth',
                    title: 'terre',
                    choiceInd: 3,
                  ),
                  PlanetCard(
                    image: 'mars',
                    title: 'mars',
                    choiceInd: 4,
                  ),
                  PlanetCard(
                    image: 'jupiter',
                    title: 'jupiter',
                    choiceInd: 5,
                  ),
                  PlanetCard(
                    image: 'saturn',
                    title: 'saturne',
                    choiceInd: 6,
                  ),
                  PlanetCard(
                    image: 'uranus',
                    title: 'uranus',
                    choiceInd: 7,
                  ),
                  PlanetCard(
                    image: 'neptune',
                    title: 'neptune',
                    choiceInd: 8,
                  ),
                  PlanetCard(
                    title: 'Random',
                    image: 'astroInBox',
                    choiceInd: 9,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanetCard extends StatelessWidget {
  PlanetCard({
    Key key,
    @required this.image,
    this.title,
    this.choiceInd,
  }) : super(key: key);
  final String image;

  final String title;
  final int choiceInd;

  @override
  Widget build(BuildContext context) {
    //getEmail();

    return TextButton(
      onPressed: () {
        planeteInd = choiceInd;
        questNum = 1;
        questNumRandom = 1;
        if (planeteInd == 9) {
          Navigator.pushReplacementNamed(context, '/levelChoiceRandom');
        } else {
          Navigator.pushReplacementNamed(context, '/levelChoice');
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 7,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/planets/$image.png',
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: myRed,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                alignment: Alignment.center,
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
