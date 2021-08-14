import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/quiz_score.dart';
import './widgets/score.dart';
import './widgets/score_bar.dart';
import './second_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizScore()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Spacer(),
            ScoreBar(),
            Score(),
            Spacer(),
            OutlinedButton(
              child: Text("QuizPage"),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}










