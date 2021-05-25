
//import 'dart:html';


import 'package:flutter/cupertino.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

class Users{
String name;
String email;
int etoiles;
String naissance;
String avatar;
Users({///
 this.name, 
this.email ,
 this.etoiles,
 this.naissance ,
 this.avatar ,

});
factory Users.fromJson(Map<String, dynamic> map){
return Users( 
         name: map['name'],
         email: map['email'],
         etoiles: map['etoiles'],
         naissance: map['naissance'],
         avatar: map['avatar']
);

}
Map<String, dynamic> toJson() =>
{'name':name,
'email':email,
'etoiles':etoiles,
'naissance':naissance,
'avatar':avatar,
};
bool email_ver(String _email)
{
 if(this.email == _email){return true;}
 else return false;
}



}