import 'package:flutter/cupertino.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

class Users {
  // une classe pour contenir es données de lutilisateur

  String name;
  String email;
  int etoiles;
  String naissance;
  String avatar;
  String badges;
  Users({
    ///
    this.name,
    this.email,
    this.etoiles,
    this.naissance,
    this.avatar,
    this.badges,
  });
  factory Users.fromJson(Map<String, dynamic> map) {
    return Users(
      name: map['name'],
      email: map['email'],
      etoiles: map['etoiles'],
      naissance: map['naissance'],
      avatar: map['avatar'],
      badges: map['badges'],
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'etoiles': etoiles,
        'naissance': naissance,
        'avatar': avatar,
        'badges': badges,
      };
  bool email_ver(String _email) {
    if (this.email == _email) {
      return true;
    } else
      return false;
  }
}
