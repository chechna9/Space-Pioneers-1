import 'package:animated_widgets/animated_widgets.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';

class SplashScreen extends StatefulWidget {
  final AudioPlayer mainAudioPlayer;
  SplashScreen({@required this.mainAudioPlayer});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void playMusic() {
    widget.mainAudioPlayer.play(mainMusicPath, isLocal: true);
    widget.mainAudioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: myRed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Logo(myBlue: myBlue),
            Midle(),
            Footer(myRed: myRed),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key key,
    @required this.myRed,
  }) : super(key: key);

  final Color myRed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Inscrire(myRed: myRed),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: SeConnecter(myRed: myRed),
            ),
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key key,
    @required this.myBlue,
  }) : super(key: key);

  final Color myBlue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        //first logo star row
        Positioned(
          top: -25,
          left: 75,
          child: Star(
            scale: 2.5,
            angle: -50,
          ),
        ),
        Positioned(
          top: -25,
          left: 135,
          child: Star(
            scale: 2.5,
            angle: -50,
          ),
        ),
        //Second logo star row
        Positioned(
          top: 14,
          left: 10,
          child: Star(
            scale: 2.5,
            angle: -48,
          ),
        ),
        Positioned(
          top: 14,
          left: 175,
          child: Star(
            scale: 2.5,
            angle: -47,
          ),
        ),

        Container(child: Title(myBlue: myBlue)),
        //Third logo star row
        Positioned(
          top: 65,
          left: -25,
          child: Star(
            scale: 2.5,
            angle: -48,
          ),
        ),

        Positioned(
          top: 65,
          left: 93,
          child: Star(
            scale: 2.5,
            angle: -50,
          ),
        ),
        Positioned(
          top: 65,
          left: 209,
          child: Star(
            scale: 2.5,
            angle: -47,
          ),
        ),
      ],
    );
  }
}

class Midle extends StatelessWidget {
  const Midle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image(
          image: AssetImage('assets/images/other/astroInBox.png'),
        ),
        //first star row
        Positioned(
          top: 0,
          left: 40,
          child: Star(
            angle: -80,
            scale: 2.8,
          ),
        ),

        Positioned(
          top: 0,
          left: 180,
          child: Star(
            angle: -80,
            scale: 1.7,
          ),
        ),
        //Second star row

        Positioned(
          top: 44,
          left: -15,
          child: Star(
            angle: -80,
            scale: 1.7,
          ),
        ),

        Positioned(
          top: 56,
          left: 235,
          child: Star(
            angle: -80,
            scale: 2.8,
          ),
        ),
        //Third star row

        Positioned(
          top: 109,
          left: 25,
          child: Star(
            angle: -80,
            scale: 2.8,
          ),
        ),

        Positioned(
          top: 105,
          left: 198,
          child: Star(
            angle: -80,
            scale: 2.2,
          ),
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
    @required this.myBlue,
  }) : super(key: key);

  final Color myBlue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //to make stroke
        AutoSizeText(
          'SPACE\nPIONEERS',
          style: TextStyle(
            height: 0.9,
            fontFamily: 'Quartzo',
            fontSize: 50,
            foreground: Paint()
              ..color = myBlue
              ..style = PaintingStyle.stroke
              ..strokeWidth = 8,
          ),
          textAlign: TextAlign.center,
        ),
        AutoSizeText(
          'SPACE\nPIONEERS',
          style: TextStyle(
            height: 0.9,
            color: Colors.white,
            fontFamily: 'Quartzo',
            fontSize: 50,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class Star extends StatelessWidget {
  Star({
    this.angle: 0,
    this.scale: 1,
  });
  final double angle;
  final double scale;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: ShakeAnimatedWidget(
        enabled: true,
        shakeAngle: Rotation.deg(z: 15),
        duration: Duration(milliseconds: 1500),
        curve: Curves.linear,
        child: Image.asset(
          'assets/images/other/star.png',
          scale: scale,
        ),
      ),
    );
  }
}

class SeConnecter extends StatelessWidget {
  const SeConnecter({
    Key key,
    @required this.myRed,
  }) : super(key: key);

  final Color myRed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: AutoSizeText(
        'Se connecter',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        maxLines: 1,
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 15),
        backgroundColor: myRed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(
            color: myRed,
            width: 2,
          ),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
    );
  }
}

class Inscrire extends StatelessWidget {
  const Inscrire({
    Key key,
    @required this.myRed,
  }) : super(key: key);

  final Color myRed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: AutoSizeText(
          'S\'inscrire',
          style: TextStyle(
            color: myRed,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          maxLines: 1,
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
              color: myRed,
              width: 2,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/inscription');
        });
  }
}
