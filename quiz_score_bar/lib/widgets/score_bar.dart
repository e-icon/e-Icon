import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_score.dart';

class ScoreBar extends StatefulWidget {
  const ScoreBar({Key? key}) : super(key: key);

  @override
  _ScoreBarState createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width - 100;
    final quizScore = context.watch<QuizScore>().quizScore;

    return Row(
      children: [
        Expanded(
          child: Container(
            child: Icon(Icons.adb),
          ),
        ),
        Container(
          width: maxWidth,
          child: LinearProgressIndicator(
            value: quizScore/100,
          ),
        ),
        Expanded(
          child: Container(
            child: Icon(Icons.adb),
          ),
        ),
      ],
    );
  }
}