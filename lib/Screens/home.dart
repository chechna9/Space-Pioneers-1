import 'package:animated_widgets/animated_widgets.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color myYellow = Color(0xffffcc00);
  final Color myBlue = Color(0xff0c0026);
  final Color myRed = Color(0xffe6023d);
  double DH; //device height
  double DW; //device width

  @override
  Widget build(BuildContext context) {
    DH = MediaQuery.of(context).size.height;
    DW = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        color: myRed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Container()),
                  Expanded(
                      flex: 2,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          //first logo star row
                          Positioned(
                            top: -DH * 0.03,
                            left: DW * 0.17,
                            child: Star(
                              scale: 2.5,
                              angle: -50,
                            ),
                          ),
                          Positioned(
                            top: -DH * 0.03,
                            left: DW * 0.32,
                            child: Star(
                              scale: 2.5,
                              angle: -50,
                            ),
                          ),
                          //Second logo star row
                          Positioned(
                            top: DH * 0.017,
                            left: DW * 0.023,
                            child: Star(
                              scale: 2.5,
                              angle: -48,
                            ),
                          ),
                          Positioned(
                            top: DH * 0.017,
                            left: DW * 0.425,
                            child: Star(
                              scale: 2.5,
                              angle: -47,
                            ),
                          ),
//i had a problem whith the third star
//row so i need to implement it another place
                          Container(child: Title(myBlue: myBlue)),
                        ],
                      )),
                  Expanded(
                    flex: 3,
                    child: Midle(DW: DW, DH: DH),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Midle extends StatelessWidget {
  const Midle({
    Key key,
    @required this.DW,
    @required this.DH,
  }) : super(key: key);

  final double DW;
  final double DH;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/other/astroInBox.png'),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        //Third logo star row
        Positioned(
          top: -DH * 0.17,
          left: DW * 0.17,
          child: Star(
            scale: 2.5,
            angle: -48,
          ),
        ),
        Positioned(
          top: -DH * 0.17,
          left: DW * 0.452,
          child: Star(
            scale: 2.5,
            angle: -50,
          ),
        ),
        Positioned(
          top: -DH * 0.17,
          left: DW * 0.695,
          child: Star(
            scale: 2.5,
            angle: -47,
          ),
        ),

        //first star row
        Positioned(
          top: 0,
          left: DW * 0.3,
          child: Star(
            angle: -80,
            scale: 2.8,
          ),
        ),
        Positioned(
          top: 0,
          left: DW * 0.65,
          child: Star(
            angle: -80,
            scale: 1.7,
          ),
        ),
        //Second star row
        Positioned(
          top: DH * 0.05,
          left: DW * 0.18,
          child: Star(
            angle: -80,
            scale: 1.7,
          ),
        ),
        Positioned(
          top: DH * 0.065,
          left: DW * 0.79,
          child: Star(
            angle: -80,
            scale: 2.8,
          ),
        ),
        //Third star row
        Positioned(
          top: DH * 0.128,
          left: DW * 0.28,
          child: Star(
            angle: -80,
            scale: 2.8,
          ),
        ),
        Positioned(
          top: DH * 0.125,
          left: DW * 0.7,
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
        //shakeAngle: Rotation.deg(z: 40),
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
      onPressed: () => Navigator.pushNamed(context, '/login'),
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
      onPressed: () => Navigator.pushNamed(context, '/inscription'),
    );
  }
}
