import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resScore;
  final Function resetQuiz;
  Result(this.resScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = 'you did it !';

    if (resScore <= 5) {
      resultText = "ah sisi la famille";
    } else if (resScore <= 7) {
      resultText = "T'es un bon";
    } else if (resScore <= 9) {
      resultText = "T'es spécial";
    } else {
      resultText = "t'es un méchant";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left),
        ),
        FlatButton(
          child: Text('Relancer le quizz'),
          onPressed: resetQuiz,
        )
      ],
    );
  }
}
