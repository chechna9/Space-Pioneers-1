
import 'dart:html';

import 'package:astro01/Screens/testing.dart';
import 'package:flutter/cupertino.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

class User{
String name;
String email;
int points;
int etoiles;
String naissance;
User({///
@required this.name, 
@required this.email ,
@required this.points,
@required this.etoiles,
@required this.naissance ,
});
factory User.fromJson(Map<String, dynamic> map){
return User( 
         name: map['name'],
         email: map['email'],
         points: map['points'],
         etoiles: map['etoiles'],
         naissance: map['naissance']
);

}
Map<String, dynamic> toJson() =>
{'name':name,
'email':email,
'points':points,
'etoiles':etoiles,
'naissance':naissance,
};
   


}
