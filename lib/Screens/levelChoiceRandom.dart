import 'package:astro01/Screens/loading.dart';
import 'package:astro01/Screens/randomSection.dart';
import 'package:astro01/classes/trace.dart';
import 'package:astro01/variable_globale/variable.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

int planeteInd;

class LevelChoiceRandom extends StatefulWidget {
  @override
  _LevelChoiceRandomState createState() => _LevelChoiceRandomState();
}

class _LevelChoiceRandomState extends State<LevelChoiceRandom> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Navigator.pushReplacementNamed(context, '/planetChoice');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/planetChoice');
      },
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: FutureBuilder<List<Trace>>(
              future: gettrace(user.email),
              builder: (context, AsyncSnapshot<List<Trace>> snapshot) {
                if (snapshot.hasData == false) {
                  return LoadingScreen();
                }
                trace = snapshot.data[0];
                return Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/planetChoice');
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
                                maxLines: 2,
                                style: TextStyle(
                                  color: myRed,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 45,
                                ),
                              ),
                              AutoSizeText(
                                'Seulement le niveau difficile \nqui contient les badges.',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SelectLevelBox(
                                  text: 'Facile',
                                  color: Color(0xff1BEFBC),
                                  onPressed: () {
                                    nbTentatives = 25;
                                    indices = [0, 1, 2, 3];
                                    points = 0;
                                    factRecomp = facileRcmpRndm;
                                    ableToBadge = false;
                                    cliquerRandom = true;
                                    Navigator.pushReplacementNamed(
                                        context, '/random');
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SelectLevelBox(
                                    text: 'Moyen',
                                    color: Color(0xff1759BC),
                                    onPressed: () {
                                      nbTentatives = 20;
                                      points = 0;
                                      indices = [0, 1, 2, 3];
                                      factRecomp = moyenRcmpRndm;
                                      ableToBadge = false;
                                      cliquerRandom = true;
                                      Navigator.pushReplacementNamed(
                                          context, '/random');
                                    }),
                                SizedBox(
                                  height: 30,
                                ),
                                SelectLevelBox(
                                    text: 'Difficile',
                                    color: Color(0xffE1023C),
                                    onPressed: () {
                                      nbTentatives = 10;
                                      points = 0;
                                      indices = [0, 1, 2, 3];
                                      factRecomp = difficileRcmpRndm;
                                      ableToBadge = true;
                                      cliquerRandom = true;
                                      Navigator.pushReplacementNamed(
                                          context, '/random');
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
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

Future<List<Trace>> gettrace(String email_) async {
  final response = await Injector.appInstance
      .get<SupabaseClient>()
      .from('Trace')
      .select()
      .execute();
  final dataList = response.data as List;
  return dataList
      .map((map) => Trace.fromJson(map))
      .where((dataList) => dataList.email_ver(email_))
      .toList();
}
