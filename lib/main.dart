import 'package:flutter/material.dart';
import 'package:my_app/result.dart';

import './quizz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  static const _question = [
    {
      "questionText": "Quel est ta couleur favorite?",
      "answer": [
        {"text": "Noir", "score": 3},
        {"text": "Rouge", "score": 0},
        {"text": "Bleu", "score": 2}
      ]
    },
    {
      "questionText": "Ton animal favori ?",
      "answer": [
        {"text": "Chat", "score": 1},
        {"text": "Mouton", "score": 3},
        {"text": "Chameaux", "score": 2}
      ]
    },
    {
      "questionText": "Ta ville préféré ?",
      "answer": [
        {"text": "Paris", "score": 3},
        {"text": "Bali", "score": 0},
        {"text": "Londres", "score": 2},
        {"text": "Tokyo", "score": 1}
      ]
    },
  ];

  var _totalScore = 0;
  void _answerQuestion(int score) {
    if (_questionIndex < _question.length - 1) {
      // print("question num " )+ _questionIndex);
      _totalScore += score;
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _question.length - 1
            ? Quizz(_answerQuestion, _question, _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
