import 'package:quizzler/questions.dart';

class QuizBrain {
  int _questionNumber=0;
  //Making Question 
  List<Questions> _questions = [
    Questions(newquestion:'Do you like nightmares 2 gameplay..?',newanswer:true),
     Questions(newquestion:'Do you like basketball game..?',newanswer:true),
      Questions(newquestion:'Pubg Not banned in india',newanswer:false),
       Questions(newquestion:'White Crows are still in earth',newanswer:false),
  ];

  void nextquestion(){
    if(_questionNumber<_questions.length-1) _questionNumber++;
  }
   
   String getquestion(){
     return _questions[_questionNumber].question;
   }

  bool getCorrectAnswer(){
    return _questions[_questionNumber].answer;
  }
}