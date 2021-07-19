class Aleatoire {
  //une classe question pour contenir une question du quiz avec la reponse correcte et les autres proposition  specialement pour la section random

  String question;
  String correct;
  String choice1;
  String choice2;
  String choice3;

  Aleatoire(
      this.question, this.correct, this.choice1, this.choice2, this.choice3);

  Aleatoire.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    correct = json['correct'];
    choice1 = json['choice1'];
    choice2 = json['choice2'];
    choice3 = json['choice3'];
  }
}
