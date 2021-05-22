import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'splashScreen.dart';

class LevelChoice extends StatefulWidget {
  @override
  _LevelChoiceState createState() => _LevelChoiceState();
}

class _LevelChoiceState extends State<LevelChoice> {
  get audioCache => null;

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Choisir\nla difficulté !',
                    style: TextStyle(
                      color: myRed,
                      fontWeight: FontWeight.w900,
                      fontSize: 45,
                    ),
                  ),
                  AutoSizeText(
                    'Selon votre niveau.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 2,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SelectLevelBox(
                    text: 'Facile',
                    color: Color(0xff1BEFBC),
                    onPressed: () {
                      Navigator.pushNamed(context, '/planetChoice');
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SelectLevelBox(
                      text: 'Moyen',
                      color: Color(0xff1759BC),
                      onPressed: () {
                        Navigator.pushNamed(context, '/planetChoice');
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  SelectLevelBox(
                      text: 'Difficile',
                      color: Color(0xffE1023C),
                      onPressed: () {
                        Navigator.pushNamed(context, '/planetChoice');
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectLevelBox extends StatelessWidget {
  SelectLevelBox({Key key, this.color, this.text, this.onPressed})
      : super(key: key);
  final String text;
  final Color color;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: color,
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: AutoSizeText(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 45,
            ),
          ),
        ),
      ),
    );
  }
}
