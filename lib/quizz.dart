import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quizz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final Function answerQuestion;
  final int questionIndex;

  Quizz(@required this.answerQuestion, @required this.question,
      @required this.questionIndex);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question[questionIndex]["questionText"]),
        ...(question[questionIndex]["answer"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer["score"]), answer["text"]);
        }).toList()
      ],
    );
  }
}
