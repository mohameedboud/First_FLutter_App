import 'package:flutter/material.dart';
class Quiz extends StatefulWidget{
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
   int score =0;
   int currentQuestion =0 ;
   var quiz=[
     {"title": "Question 1", "answer": [
       {"answer":"answer 11", "correct": false},
       {"answer":"answer 12", "correct": true},
       {"answer":"answer 13", "correct": false},
     ]
     },
     {"title": "Question 2", "answer": [
       {"answer":"answer 21", "correct": false},
       {"answer":"answer 22", "correct": true},
       {"answer":"answer 23", "correct": false},
     ]
     },
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,),
      body: (this.currentQuestion >= quiz.length)?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "score: ${(100* score / quiz.length).round()} %",
                style: TextStyle(fontSize: 22, color: Colors.deepOrangeAccent),
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    this.currentQuestion=0;
                    this.score=0;
                  });
                },
                color: Colors.deepOrangeAccent,
                child: Text("Restart ...", style: TextStyle(fontSize: 22),),
                textColor: Colors.white,
              )
            ],
          )
        )
        :ListView(
        children: <Widget> [
          ListTile(
            title: Center(
              child: Text(
                  "Question : ${currentQuestion+1}/${quiz.length}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold ),
              )
            ),
          ),
          ListTile(
            title: Text(
              '${quiz[currentQuestion]['title']} ?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ...(quiz[currentQuestion]['answer'] as List<Map<String, Object>>).map((e){
            return ListTile(
            title: Padding(
            padding: const EdgeInsets.all(6.0),
            child: RaisedButton(
               color: Colors.deepOrangeAccent,
    onPressed: (){
                 setState(() {
                   if(e['correct']==true) ++score;
                   ++this.currentQuestion;
                 });
      },
    child: Container(
      child: Align( alignment: Alignment.centerLeft,
      child: Text("${e['answer']}",style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),)),
      padding: EdgeInsets.all(10),),
    ),

             ),
            );
    })
        ],
      ),
    );
  }
}