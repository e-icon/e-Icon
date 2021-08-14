import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_score.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _showToast(BuildContext context, String text) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(text),
          duration: Duration(milliseconds: 300),
        ),
      );
    }

    void _incrementCounter() {
      if(context.read<QuizScore>().quizScore < 100){
        context.read<QuizScore>().plus();

        if(context.read<QuizScore>().quizScore == 100){
          _showToast(context, "Success!");
        }
      }
      else{
        _showToast(context, "Success!");
      }
    }

    void _decrementCounter() {
      if(context.read<QuizScore>().quizScore >= 5){
        context.read<QuizScore>().minus();

        if(context.read<QuizScore>().quizScore == 0){
          _showToast(context, "Fail");
        }
      }
      else{
        _showToast(context, "Fail");
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          child: Text("correct +5"),
          onPressed: _incrementCounter,
        ),
        OutlinedButton(
          child: Text("wrong -5"),
          onPressed: _decrementCounter,
        ),
      ],
    );
  }
}
