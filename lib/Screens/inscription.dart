

import 'package:astro01/variable_globale/variable.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import '../components/TextInput.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';
import 'levelChoice.dart';
import 'homeScreen.dart';

const supabaseUrl = 'https://ltsahdljhuochhecajen.supabase.co';
  const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyMDQ3OTY4MiwiZXhwIjoxOTM2MDU1NjgyfQ.IoKgpB9APMw5Te9DYgbJZIbYcvPOwl41dl4-IKFjpVk';
  final supabaseclient = SupabaseClient(supabaseUrl, supabaseKey);
   


class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
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
              'S\'inscrire',
              style: TextStyle(
                color: myRed,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topCenter,
              children: [
                RegCard(
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

class RegCard extends StatefulWidget {
  RegCard({
    Key key,
    this.formKey,
  }) : super(key: key);
  GlobalKey<FormState> formKey;

  @override
  _RegCardState createState() => _RegCardState();
}

class _RegCardState extends State<RegCard> {
  DateTime _dateTime;
  String _dateValidate = "Date de Naissance";

  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _username;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _username = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextForm(
                    labelText: "Username",
                    controller: _username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' please enter your name ';
                      }

                      return null;
                    }),
                SizedBox(
                  height: 12,
                ),

                CustomTextForm(
                    labelText: "Email",
                    controller: _email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' please enter your email ';
                      } else
                        return null;
                    }),
                SizedBox(
                  height: 12,
                ),
                CustomTextForm(
                    obscured: true,
                    labelText: "Mot de Passe",
                    controller: _password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' please enter your mot de passe ';
                      }

                      return null;
                    }),

                SizedBox(
                  height: 12,
                ),
                //date de naissance
                FormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (e) {
                    _dateValidate = _dateTime == null
                        ? 'Il faut selectionner une date'
                        : "";
                  },
                  builder: (FormFieldState<dynamic> e) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: myRed,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                            color:
                                _dateValidate != "Il faut selectionner une date"
                                    ? myBlue
                                    : myYellow,
                            size: 30,
                          ),
                          onPressed: () {
                            showDatePicker(
                              initialEntryMode: DatePickerEntryMode.input,
                              context: context,
                              initialDate: _dateTime == null
                                  ? DateTime.now()
                                  : _dateTime,
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                            ).then((value) {
                              setState(() {
                                _dateTime = value;
                              });
                            });
                          },
                        ),
                        Text(
                          _dateTime == null
                              ? _dateValidate
                              : _dateTime.toString().split(" ")[0],
                          style: TextStyle(
                            color:
                                _dateValidate == "Il faut selectionner une date"
                                    ? Colors.red
                                    : null,
                            fontSize: 17,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                            _signup();
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

  Future _signup() async {
    if (_formKey.currentState.validate()) {
      final signInResult = await Injector.appInstance
      .get<SupabaseClient> ()
      .auth.
      signUp(   _email.text,_password.text);

        if(signInResult != null && signInResult.user != null && _username.text.length <= 14 )
        {  user.email=_email.text;
          await supabaseclient.from("Trace").insert({ "email":_email.text,'earth':0,'jupiter':0 ,'mars':0 , 'mercury':0 ,'neptune':0,'saturn':0, 'uranus':0, 'venus':0}).execute(); 
          await supabaseclient.from("user").insert({"name":_username.text, "email":_email.text,'etoiles':0,'naissance':_dateTime.toString().split(" ")[0],'avatar':'default'}).execute(); 
        Navigator.pushNamed(context, '/homeScreen');}
        else if (signInResult.error.message != null ||
          _username.text.length > 14) {
        String message;
        if (_username.text.length > 14) {
          message = ' taille maximale de username est 14';
        } else {
          message = signInResult.error.message;
        }
        TextButton(
            onPressed: () {}, child: Text(' erreur dans le mot ed passe'));

        showFlash(
            context: context,
            duration: const Duration(seconds: 2),
            builder: (context, controller) {
              return Flash.dialog(
                  controller: controller,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  backgroundGradient: LinearGradient(colors: [myRed, myRed]),
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        backgroundColor: myRed,
                      ),
                    ),
                  ));
            });
      }
       
  }
}
}