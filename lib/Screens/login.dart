import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import '../components/TextInput.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey _formKey;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(
            bottom: (MediaQuery.of(context).viewInsets.bottom - 100) > 0
                ? MediaQuery.of(context).viewInsets.bottom - 100
                : MediaQuery.of(context).viewInsets.bottom),
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
              'Se Connecter',
              style: TextStyle(
                color: myRed,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.topCenter,
              clipBehavior: Clip.none,
              children: [
                LogCard(
                  formKey: _formKey,
                ),
                Positioned(
                  top: -100,
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

class LogCard extends StatelessWidget {
  LogCard({
    Key key,
    this.formKey,
  }) : super(key: key);
  GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextForm(
                  labelText: 'Username',
                ),
                SizedBox(
                  height: 12,
                ),
                CustomTextForm(
                  labelText: 'Email',
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          child: Text(
                            'Se connecter',
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
                            print('se connecter');
                            formKey.currentState.validate();
                          }),
                    ),
                  ],
                ),

                ///tested
              ],
            ),
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}
