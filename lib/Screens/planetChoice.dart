import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
// import '../components/RoundedCard.dart';

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
            Navigator.pop(context);
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
                    credit: credit,
                    image: 'soleil',
                    title: 'soleil',
                    price: 20,
                    choiceInd: 0,

                  ),
                  PlanetCard(
                    credit: credit,
                    image: 'earth',
                    title: 'terre',
                    price: 20,
                    choiceInd: 3,

                  ),
                  PlanetCard(
                    credit: credit,
                    image: 'jupiter',
                    title: 'jupiter',
                    price: 20,
                    choiceInd: 5,

                  ),
                  PlanetCard(
                    credit: credit,
                    image: 'mars',
                    title: 'mars',
                    price: 20,
                    choiceInd: 4,
                  ),
                  PlanetCard(
                    credit: credit,
                    image: 'mercury',
                    title: 'mercure',
                    price: 20,
                    choiceInd: 1,
                  ),
                  PlanetCard(
                    credit: credit,
                    image: 'neptune',
                    title: 'neptune',
                    price: 20,
                    choiceInd: 8,
                  ),
                  PlanetCard(
                    credit: credit,
                    image: 'saturn',
                    title: 'saturn',
                    price: 20,
                    choiceInd: 6,

                  ),
                  PlanetCard(
                    credit: credit,
                    image: 'uranus',
                    title: 'uranus',
                    price: 20,
                    choiceInd: 7,

                  ),
                  PlanetCard(
                    credit: credit,
                    image: 'venus',
                    title: 'venus',
                    price: 20,
                    choiceInd: 2,

                  ),
                  PlanetCard(
                    credit: credit,
                    title: 'Random',
                    image: 'astroInBox',
                    price: 20,
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
    this.price: 0,
    this.credit: 0,
    @required this.image,
    this.title,
    this.choiceInd,
  }) : super(key: key);
  final String image;
  final int price; //we should chnage it
  final int credit;
  final String title;
  final int choiceInd;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        planeteInd = choiceInd;
        Navigator.pushNamed(context, '/quiz');
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
              height: credit >= price ? 20 : 0,
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
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/avatars/cadna.png'),
                        fit: BoxFit.fitWidth,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(credit >= price ? 0 : 0.5),
                            BlendMode.dstATop),
                      ),
                    ),
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



