import 'testing.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import '../components/TextInput.dart';

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
          gradient: myGradiant,
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: widget.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextForm(
                  labelText: "Username",
                ),
                SizedBox(
                  height: 12,
                ),

                CustomTextForm(
                  labelText: "Email",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomTextForm(
                  obscured: true,
                  labelText: "Mot de Passe",
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
                            print('S\'inscrire');
                            //widget.formKey.currentState.validate();
                            Navigator.pushNamed(context, '/homeScreen');
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
