import 'package:flutter/material.dart';

class QuizScore with ChangeNotifier{
  int _quizScore = 50;
  int get quizScore => _quizScore;

  void plus(){
    _quizScore += 5;
    notifyListeners();
  }

  void minus(){
    _quizScore -= 5;
    notifyListeners();
  }
}