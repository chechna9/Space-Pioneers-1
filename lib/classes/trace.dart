class Trace {
  String email;
  int earth;
  int jupiter;
  int mars;
  int mercury;
  int neptune;
  int saturn;
  int uranus;
  int venus;
  int soleil;

  Trace({
    ///
    this.email,
    this.earth,
    this.mars,
    this.jupiter,
    this.mercury,
    this.neptune,
    this.saturn,
    this.uranus,
    this.venus,
    this.soleil,
  });
  factory Trace.fromJson(Map<String, dynamic> map) {
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
      soleil: map['soleil'],
    );
  }
  Map<String, dynamic> toJson() => {
        'email': email,
        'earth': earth,
        'mars': mars,
        'jupiter': jupiter,
        'mercury': mercury,
        'neptune': neptune,
        'saturn': saturn,
        'uranus': uranus,
        'venus': venus,
        'soleil': soleil,
      };
  bool email_ver(String _email) {
    if (this.email == _email) {
      return true;
    } else
      return false;
  }
}
