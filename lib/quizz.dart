import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';

class Quiz extends StatefulWidget{
  _Quizzes createState() => _Quizzes();
}

class _Quizzes extends State<Quiz>{
 
    List<Icon> updateicons=[ ];

    void answervalidator(bool userpassedanswer){
    setState((){
        bool correctanswer=_quizBrain.getCorrectAnswer();
      if(userpassedanswer==correctanswer){
        updateicons.add(Icon(Icons.check));
      }else{
        updateicons.add(Icon(Icons.close));
      }
      _quizBrain.getquestion();
    });
    }

  QuizBrain _quizBrain=new QuizBrain();
 Widget build(BuildContext context){
   return MaterialApp(
     home: Scaffold(
       backgroundColor: Color(0xff353b4b),
       appBar:AppBar(title:Text("Quizzes")),
       body: SafeArea(child:Container(
         padding: EdgeInsets.all(22.00),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center, 
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children:<Widget>[
           Expanded(child: Center(child: Text(_quizBrain.getquestion(),style: TextStyle(fontSize:24.00,fontWeight: FontWeight.bold,color: Colors.white),)),),
           FlatButton(padding: const EdgeInsets.all(2.00),child: Text("Yes",style: TextStyle(fontSize:18.00,fontWeight: FontWeight.bold,color: Colors.white)),
           color: Colors.greenAccent,
           onPressed:(){
              answervalidator(true);         
             }),
           FlatButton(padding: const EdgeInsets.all(2.00),child: Text("No",style: TextStyle(fontSize:18.00,fontWeight: FontWeight.bold,color: Colors.white)),
           color: Colors.redAccent,
           onPressed:(){
               answervalidator(false);
             }),
           Container(
             padding: const EdgeInsets.all(12.00),
             child: Row(
               children:updateicons
             ),
           )
         ]),
       ) 
       ,),
     ),
   );
 }
}