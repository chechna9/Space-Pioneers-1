import 'package:astro01/Screens/splashScreen.dart';
import 'splashScreen.dart';
import 'testing.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import '../components/TextInput.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

const supabaseUrl = 'https://ltsahdljhuochhecajen.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyMDQ3OTY4MiwiZXhwIjoxOTM2MDU1NjgyfQ.IoKgpB9APMw5Te9DYgbJZIbYcvPOwl41dl4-IKFjpVk';
final supabaseclient = SupabaseClient(supabaseUrl, supabaseKey);

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final _formKey = GlobalKey<FormState>();
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
            //key: widget.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextForm(
                  labelText: "Username",
                  controller: _username,
                ),
                SizedBox(
                  height: 12,
                ),

                CustomTextForm(
                  labelText: "Email",
                  controller: _email,
                ),
                SizedBox(
                  height: 12,
                ),
                CustomTextForm(
                  obscured: true,
                  labelText: "Mot de Passe",
                  controller: _password,
                ),

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
                            print(_email.text);
                            _signup;
                            print('S\'inscrire');
                            widget.formKey.currentState.validate();
                            Navigator.pushNamed(context, '/quiz');
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
          .get<SupabaseClient>()
          .auth
          .signUp(_email.text, _password.text);

      if (signInResult != null && signInResult.user != null) {
        await supabaseclient.from("user").insert({
          "name": _username.text,
          "email": _email.text,
          'points': 0,
          'etoiles': 0,
          'naissance': _dateTime.timeZoneName
        }).execute();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SplashScreen()));
      } else if (signInResult.error.message != null) {
        TextButton(
            onPressed: () {}, child: Text(' erreur dans le mot ed passe'));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(signInResult.error.message)));
      }
    }
  }
}
