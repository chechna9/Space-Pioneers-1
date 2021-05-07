import 'testing.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AutoSizeText(
              'S\'inscrire',
              style: TextStyle(
                color: myRed,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                RegCard(
                  myRed: myRed,
                  myBlue: myBlue,
                ),
                Positioned(
                  top: -100,
                  left: MediaQuery.of(context).size.width * 0.31,
                  child: Image(
                    height: 150,
                    width: 150,
                    fit: BoxFit.scaleDown,
                    image: AssetImage('assets/images/other/astro.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegCard extends StatelessWidget {
  const RegCard({
    Key key,
    @required this.myRed,
    @required this.myBlue,
  }) : super(key: key);

  final Color myRed;
  final Color myBlue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
                decoration: InputDecoration(
                  labelText: 'Username',
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: myRed, width: 2),
                      borderRadius: BorderRadius.circular(100)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: myBlue, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 25, top: 20, bottom: 20),
                ),
                //onChanged: (val) => userName = val,
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                obscureText: true,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'Mot de passe',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: myRed, width: 2),
                      borderRadius: BorderRadius.circular(100)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: myBlue, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 25, top: 20, bottom: 20),
                ),
                //onChanged: (val) => password = val,
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'Date de naissance',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: myRed, width: 2),
                      borderRadius: BorderRadius.circular(100)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: myBlue, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 25, top: 20, bottom: 20),
                ),
                //onChanged: (val) => dateNessance = int.parse(val),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: myRed, width: 2),
                      borderRadius: BorderRadius.circular(100)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: myBlue, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 25, top: 20, bottom: 20),
                ),
                //onChanged: (val) => email = val,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        child: Text(
                          'S\'inscrire',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
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
                          print('S\'inscrire');
                        }),
                  ),
                ],
              ),

              ///tested
            ],
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}
