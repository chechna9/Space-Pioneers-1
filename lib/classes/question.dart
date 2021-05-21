

import 'package:flutter/cupertino.dart';

class Questions{
String questions;
String reponse_correct;
String choix1;
String  choix2;
String  choix3;
Questions({///
@required this.questions, 
@required this.reponse_correct ,
@required this.choix1,
@required this.choix2,
@required this.choix3 ,
});
factory Questions.fromJson(Map<String, dynamic> map){
return Questions( 
         questions: map['question'],
         reponse_correct: map['reponse_correct'],
         choix1: map['choix1'],
         choix2: map['choix2'],
          choix3: map['choix3']
);

}
Map<String, dynamic> toJson() =>
{'questions':questions,
'reponse_correct':reponse_correct,
'choix1':choix1,
'choix2':choix2,
'choix3':choix3,
};
}