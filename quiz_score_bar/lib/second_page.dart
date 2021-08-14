import 'package:flutter/material.dart';
import './widgets/buttons.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz Page"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: () { Navigator.pop(context, false); },
          ),
        ),
        body: Center(
          child: Buttons(),
        )
    );
  }
}
