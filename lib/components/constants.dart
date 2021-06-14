import 'package:flutter/material.dart';

const Color myYellow = Color(0xffffcc00);
const Color myBlue = Color(0xff0c0026);
const Color myRed = Color(0xffe6023d);
const Color myRed2 = Color(0xffe1023c);
const Color myGrey = Color(0xffccd2e3);
const Color choiceBlue = Color(0xff1759bc);
const Color choiceYellow = Color(0xffffcc00);
const Color choiceRed = Color(0xffff0e0e);
const Color choiceGreen = Color(0xff1bffbc);
const MaterialColor calendarColor = MaterialColor(0xffe6023d, {
  50: Color(0xffe6023d),
  100: Color(0xffe6023d),
  200: Color(0xffe6023d),
  300: Color(0xffe6023d),
  400: Color(0xffe6023d),
  500: Color(0xffe6023d),
  600: Color(0xffe6023d),
  700: Color(0xffe6023d),
  800: Color(0xffe6023d),
  900: Color(0xffe6023d),
});
const LinearGradient myGradiant = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0, 1],
  colors: [
    myBlue,
    Color(0xff50012d),
  ],
);
String mainMusicPath = "assets/music/mainMusic.mp3";
String docMusicPath = "assets/music/docMusic.mp3";
String rightMusicPath = "assets/music/rightAnswer.mp3";
String wrongMusicPath = "assets/music/wrongAnswer.mp3";
const int facileRecomp = 1;
const int moyenRecomp = 5;
const int difficileRecomp = 10;
const int facileRcmpRndm = 1;
const int moyenRcmpRndm = 2;
const int difficileRcmpRndm = 3;
