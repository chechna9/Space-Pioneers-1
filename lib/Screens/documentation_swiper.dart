import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:astro01/components/constants.dart';
import 'documentation_data.dart';
import 'documentation_details.dart';
import 'splashScreen.dart';

class Documentation extends StatefulWidget {
  final AssetsAudioPlayer docAudioPlayer;
  final AssetsAudioPlayer mainAudioPlayer;
  Documentation(
      {@required this.docAudioPlayer, @required this.mainAudioPlayer});
  @override
  _DocumentationState createState() => _DocumentationState();
}

class _DocumentationState extends State<Documentation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!mute) {
      widget.docAudioPlayer.open(
        Audio(
          docMusicPath,
        ),
        autoStart: true,
        loopMode: LoopMode.playlist,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height; //screen height
    double sw = MediaQuery.of(context).size.width; //screen width

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: myBlue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Star(angle: 8, scale: 2.8),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.white,
          iconSize: 35,
          onPressed: () {
            setState(() {
              widget.docAudioPlayer.pause();
              widget.mainAudioPlayer.playOrPause();
            });

            Navigator.pop(context);
          },
        ),
        leadingWidth: 70,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: myGradiant,
        ),
        padding: EdgeInsets.all(20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "Découvrir\nl'Univers !",
                      style: TextStyle(
                        fontSize: 40,
                        color: myRed,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 32, right: 32),
                            child: Swiper(
                              curve: Curves.decelerate,
                              itemCount: planets.length,
                              itemWidth: sw,
                              layout: SwiperLayout.STACK,
                              pagination: SwiperPagination(
                                builder: DotSwiperPaginationBuilder(
                                  activeSize: 8,
                                  size: 9,
                                  space: 8,
                                  color: Colors.white,
                                  activeColor: myRed,
                                ),
                              ),
                              itemBuilder: (context, index) {
                                return Stack(
                                  clipBehavior: Clip.none,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        SizedBox(height: sh * 0.15),
                                        Card(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(32.0),
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: sh * 0.025,
                                                    ),
                                                    Text(
                                                      planets[index].name,
                                                      style: TextStyle(
                                                        fontSize: 36,
                                                        color: const Color(
                                                            0xff47455f),
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    Text(
                                                      'Système solaire',
                                                      style: TextStyle(
                                                        fontFamily: 'Gotham',
                                                        fontSize: 18,
                                                        color: myBlue,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    SizedBox(
                                                        height: sh * 0.035),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          PageRouteBuilder(
                                                            pageBuilder:
                                                                (context, a,
                                                                        b) =>
                                                                    DetailPage(
                                                              planetInfo:
                                                                  planets[
                                                                      index],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Row(
                                                        children: [
                                                          AutoSizeText(
                                                            'Afficher plus',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Gotham',
                                                              fontSize: 18,
                                                              color: myRed,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                          Icon(
                                                            Icons.arrow_forward,
                                                            color: myRed,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: sh * 0.02,
                                                      ),
                                                      Text(
                                                        planets[index]
                                                            .position
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 120,
                                                          color: myBlue
                                                              .withOpacity(
                                                                  0.08),
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: sh * 0.04,
                                      child: Hero(
                                        tag: planets[index].position,
                                        child: Image.asset(
                                          planets[index].iconImage,
                                          //alignment: Alignment.top,
                                          height: 170,
                                          // fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            Positioned(
              top: 20,
              left: sw * 0.80,
              child: Star(angle: 8, scale: 2.8),
            ),
            Positioned(
              top: 20,
              left: sw * 0.80,
              child: Star(angle: 8, scale: 2.8),
            ),
            Positioned(
              bottom: sh * 0.2,
              left: sw * 0.80,
              child: Star(angle: 8, scale: 2.8),
            ),
            Positioned(
              top: 170,
              left: sw * 0.3,
              child: Star(angle: 8, scale: 2.8),
            ),
            Positioned(
              top: 270,
              left: -10,
              child: Star(angle: 8, scale: 2.8),
            ),
            Positioned(
              bottom: sh * 0.07,
              left: 50,
              child: Star(angle: 8, scale: 2.8),
            ),
          ],
        ),
      ),
    );
  }
}
