import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // second connection between State and StatefulWidget
    // TODO: implement createState
    return MyAppState();
  }
} // StatefulWidget will be re-created when the external datas change

class MyAppState extends State<MyApp> {
  // <> points MyAppState class to MyApp class, State is persistent
  var questionIndex = 0;

  void AnswerQuestion() {
    questionIndex = questionIndex + 1;
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favourite color?',
      'What\s your favourite animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: AnswerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: AnswerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: AnswerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
