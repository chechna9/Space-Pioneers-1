
import 'dart:html';


import 'package:astro01/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

class Trace{
String email;
int  earth;
int  jupiter;
int mars;
int mercury;
int neptune;
int saturn;
int uranus;
int venus;

Trace({///
 this.email, 
this.earth ,
 this.mars,
 this.jupiter ,
 this.mercury,
 this.neptune,
 this.saturn,
 this.uranus,
 this.venus,

});
factory Trace.fromJson(Map<String, dynamic> map){
return Trace( 
        
         email: map['email'],
         earth: map['earth'],
         mars: map['mars'],
         jupiter: map['jupiter'],
         mercury: map['mercury'],
         neptune: map['neptune'],
         saturn: map['saturn'],
         uranus: map['uranus'],
         venus: map['venus'],



);

}
Map<String, dynamic> toJson() =>
{ 'email':email,
         'earth': earth,
         'mars':mars,
         'jupiter':jupiter,
         'mercury':mercury,
         'neptune':neptune,
         'saturn':saturn,
         'uranus':uranus,
         'venus':venus,
};
bool email_ver(String _email)
{print(this.email);
 if(this.email == _email){return true;}
 else return false;
}



}