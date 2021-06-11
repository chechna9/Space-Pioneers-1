import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:astro01/Screens/loading.dart';
import 'package:astro01/classes/User.dart';
import 'package:astro01/main.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';
import 'splashScreen.dart';

class HomeScreen extends StatefulWidget {
  final AssetsAudioPlayer mainAudioPlayer;
  HomeScreen({@required this.mainAudioPlayer});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height; //screen height
    double sw = MediaQuery.of(context).size.width; //screen width
    Users user1 = new Users();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: FutureBuilder<List<Users>>(
        future: getUsers(user.email),
        builder: (context, AsyncSnapshot<List<Users>> snapshot) {
          if (snapshot.hasData == false) {
            return LoadingScreen();
          }
          user = snapshot.data[0];
          print('user');
          print(user.email);

          return Material(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                gradient: myGradiant,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: sh * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Transform.rotate(
                          angle: 3.15,
                          child: Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        onPressed: () async {
                          await Injector.appInstance
                              .get<SupabaseClient>()
                              .auth
                              .signOut();
                          Navigator.pushReplacementNamed(
                              context, '/splashScreen');
                        },
                      ),
                      SoundCntrl(
                        mainAudioPlayer: widget.mainAudioPlayer,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sh * 0.01,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Salut ${user.name} !',
                            style: TextStyle(
                              color: myRed,
                              fontWeight: FontWeight.w900,
                              fontSize: 45,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AutoSizeText(
                            'Bienvenue dans cette belle aventure',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: -35,
                        left: sw * 0.8,
                        child: Star(angle: 8, scale: 2.8),
                      ),
                      Positioned(
                        top: -28,
                        right: 115,
                        child: Star(angle: 8, scale: 2.8),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sh * 0.0315,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Column(
                              children: [
                                SelectBox(
                                  image: 'astroReading',
                                  text: 'Decouvrir',
                                  color: myRed,
                                  onPressed: () {
                                    widget.mainAudioPlayer.pause();
                                    Navigator.pushNamed(
                                        context, '/documentation');
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SelectBox(
                                    image: 'ridingRocket',
                                    text: 'Jouer',
                                    color: Color(0xffAB02E6),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/planetChoice');
                                    }),
                                SizedBox(
                                  height: 30,
                                ),
                                SelectBox(
                                    image: 'ridingMoon',
                                    text: 'Profile',
                                    color: Color(0xff1759BC),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/profilePage');
                                    }),
                              ],
                            ),
                            Positioned(
                              bottom: -100,
                              left: 30,
                              child: Star(angle: 8, scale: 2.8),
                            ),
                            Positioned(
                              bottom: -40,
                              right: 10,
                              child: Star(angle: 8, scale: 2.8),
                            ),
                            Positioned(
                              bottom: 130,
                              left: 0,
                              child: Star(angle: 8, scale: 2.8),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SoundCntrl extends StatefulWidget {
  final AssetsAudioPlayer mainAudioPlayer;
  SoundCntrl({Key key, this.mainAudioPlayer}) : super(key: key);

  @override
  _SoundCntrlState createState() => _SoundCntrlState();
}

class _SoundCntrlState extends State<SoundCntrl> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          mute
              ? widget.mainAudioPlayer.setVolume(0.8)
              : widget.mainAudioPlayer.setVolume(0);
          mute = mute ? false : true;
        });
      },
      icon: Icon(
        !mute ? Icons.music_note_rounded : Icons.music_off_rounded,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

class SelectBox extends StatelessWidget {
  SelectBox({Key key, this.color, this.image, this.text, this.onPressed})
      : super(key: key);
  final String image;
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
            vertical: 8,
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    fit: BoxFit.scaleDown,
                    image: AssetImage('assets/images/other/$image.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: AutoSizeText(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<Users>> getUsers(String email_) async {
  final response = await Injector.appInstance
      .get<SupabaseClient>()
      .from('user')
      .select()
      .execute();
  final dataList = response.data as List;
  return dataList
      .map((map) => Users.fromJson(map))
      .where((dataList) => dataList.email_ver(email_))
      .toList();
}
