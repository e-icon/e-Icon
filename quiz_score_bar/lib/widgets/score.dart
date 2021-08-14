import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_score.dart';

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizScore = context.watch<QuizScore>().quizScore;

    print('Score');

    return Container(
      child: Text(
        quizScore.toString(),
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}