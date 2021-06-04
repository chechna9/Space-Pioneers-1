import 'package:flutter/material.dart';
import 'package:astro01/components/constants.dart';
import '../components/constants.dart';
import 'quiz.dart';
import 'randomSection.dart';


int etoiles;

class BravoNiveau extends StatefulWidget {
  @override
  _BravoNiveauState createState() => _BravoNiveauState();
}

class _BravoNiveauState extends State<BravoNiveau> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [ 
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(icon: IconButton(icon: Icon(Icons.cancel_outlined), color: myGrey, iconSize: 30, onPressed: () => Navigator.of(context).pop(true),), onPressed: () {  },
        ),),],),
      backgroundColor: myRed,
      body: Center(
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('BRAVO !',style: TextStyle(color: myYellow, fontSize: 40, fontWeight: FontWeight.w900, fontFamily: 'Gotham'),),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text('Vous avez collecté \n\ $etoiles !',style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.normal, fontFamily: 'Gotham'), textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Image(
          image: AssetImage('assets/images/avatars/rocket_badge.png'),
        ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text('Allez voir votre profil !',style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal, fontFamily: 'Gotham'), textAlign: TextAlign.center,),
                 IconButton(icon: Icon(Icons.arrow_forward_outlined), color: Colors.white, iconSize: 30, onPressed: () => {
                    Navigator.pushReplacementNamed(context, '/profilePage'),
                 }),],),
            ],),
      ),
 );
  }
}