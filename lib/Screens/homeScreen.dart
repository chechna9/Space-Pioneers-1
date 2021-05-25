import 'package:astro01/Screens/profilePage.dart';
import 'package:astro01/Screens/quiz.dart';
import 'package:astro01/classes/User.dart';
import 'package:astro01/classes/trace.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';
import 'splashScreen.dart';
import 'inscription.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get audioCache => null;
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
            return null;
          }
          user = snapshot.data[0];
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
                    height: sh * 0.03,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    SoundCntrl(),
                  ]),
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
                            'Zinou nhar el lyoum mabrok idkom',
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
                        top: -50,
                        right: -10,
                        child: Star(angle: 8, scale: 2.8),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sh * 0.1,
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
                                          context, '/levelChoice');
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
                              left: 50,
                              child: Star(angle: 8, scale: 2.8),
                            ),
                            Positioned(
                              bottom: -50,
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
  SoundCntrl({
    Key key,
  }) : super(key: key);

  @override
  _SoundCntrlState createState() => _SoundCntrlState();
}

class _SoundCntrlState extends State<SoundCntrl> {
  bool mute = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
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
