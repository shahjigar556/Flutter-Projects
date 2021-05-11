import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home:Scaffold(
         appBar: AppBar(
           title:Center(child: Text('Quiz App'))
         ),
         body:QuizApp(),
       )
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizBrain question=QuizBrain();
  List <Icon> response=[];
  void checkAns(bool userAns){
    setState(() {
      if(question.isEmpty()){
        question.reset();
        print('Question is now empty');
        Alert(
          context: context,
          //type: AlertType.error,
          title: "Quiz App",
          desc: "Start Again",
          buttons: [
            DialogButton(
              child: Text(
                "Yes",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                question.reset();
                Navigator.pop(context);
                },
              width: 120,
            )
          ],
        ).show();
        response.clear();
      }
      if(userAns==question.getQuestionAns()){
        response.add(Icon(Icons.add,color:Colors.green));
      }else{
        // ans does not match
        response.add(Icon(Icons.check,color:Colors.red));
      }
      question.nextQuestion();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child:Text(question.getQuestionText()),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                child: Container(
                    child:Text('True')
                ),
                onPressed: (){
                  checkAns(true);
                },
              ),
            ),
            Expanded(
                child:TextButton(
                  child:Container(
                      child:Text('False')
                  ),
                  onPressed: (){
                    checkAns(false);
                  },
                )
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Container(
                margin: EdgeInsets.all(15.0),
                child:Row(
                  children: response,
                )
            )
          ],
        )
      ],
    );
  }
}




