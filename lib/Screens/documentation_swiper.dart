import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:astro01/components/constants.dart';
import 'documentation_data.dart';
import 'documentation_details.dart';

class Documentation extends StatefulWidget {
  @override
  _DocumentationState createState() => _DocumentationState();
}

class _DocumentationState extends State<Documentation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.white,
          iconSize: 35,
          onPressed: () {
            print("Go back");
            Navigator.pop(context);
          },
        ),
        leadingWidth: 70,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1],
            colors: [
              myBlue,
              Color(0xff50012d),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  top: 40,
                  left: 40,
                  right: 20,
                ),
                child: Column(
                  children: <Widget>[
                    // Container(
                    //   alignment: Alignment.topLeft,
                    //   child: IconButton(
                    //     icon: Icon(Icons.arrow_back),
                    //     onPressed: () {
                    //       //precedent page here
                    //     },
                    //     color: Colors.white,
                    //     iconSize: 35,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Découvrir l'Univers!",
                        style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 34,
                          color: const Color(0xffE6023D),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 500,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 32, right: 32),
                        child: Swiper(
                          itemCount: planets.length,
                          itemWidth: MediaQuery.of(context).size.width - 1 * 50,
                          layout: SwiperLayout.STACK,
                          pagination: SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                              activeSize: 9,
                              size: 9,
                              space: 8,
                              color: Colors.white,
                              activeColor: myRed,
                            ),
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, a, b) => DetailPage(
                                      planetInfo: planets[index],
                                    ),
                                  ),
                                );
                              },
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      SizedBox(height: 120),
                                      Card(
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(32.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(height: 100),
                                              Text(
                                                planets[index].name,
                                                style: TextStyle(
                                                  fontFamily: 'Gotham',
                                                  fontSize: 36,
                                                  color:
                                                      const Color(0xff47455f),
                                                  fontWeight: FontWeight.w900,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Système solaire',
                                                style: TextStyle(
                                                  fontFamily: 'Gotham',
                                                  fontSize: 18,
                                                  color: myBlue,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(height: 32),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Afficher plus',
                                                    style: TextStyle(
                                                      fontFamily: 'Gotham',
                                                      fontSize: 18,
                                                      color: myRed,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    color: myRed,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Hero(
                                    tag: planets[index].position,
                                    child: Image.asset(
                                      planets[index].iconImage,
                                      alignment: Alignment.topLeft,
                                      //height: 204
                                      // fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                    right: 24,
                                    top: 200,
                                    child: Text(
                                      planets[index].position.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 150,
                                        color: myBlue.withOpacity(0.08),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
          'assets/icons/Star.png',
          scale: scale,
        ),
      ),
    );
  }
}
