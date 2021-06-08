import 'package:astro01/Screens/splashScreen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class InfoSup extends StatelessWidget {
  final String content;
  final int recomp;
  final Function onPressed;
  final bool onPressedExiste;
  InfoSup(
      {@required this.content,
      @required this.recomp,
      this.onPressed,
      @required this.onPressedExiste});
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
                  Row(
                    children: [
                      Star(
                        scale: 2.2,
                        angle: 4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  )
                ],
              ),
              onPressedExiste
                  ? Column(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.play_circle_fill,
                              size: 30,
                              color: myYellow,
                            ),
                            onPressed: onPressed),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  : SizedBox(
                      width: 0,
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
