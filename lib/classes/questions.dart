class Question {
  String planete;
  String question;
  String correct;
  String choice1;
  String choice2;
  String choice3;
  String infosupp;

  Question(this.planete, this.question, this.correct, this.choice1, this.choice2, this.choice3, this.infosupp);

  Question.fromJson(Map<String, dynamic> json)
  {
    planete = json['planete'];
    question = json['question'];
    correct = json['correct'];
    choice1 = json['choice1'];
    choice2 = json['choice2'];
    choice3 = json['choice3'];
    infosupp = json['infosupp'];
  }

  
}