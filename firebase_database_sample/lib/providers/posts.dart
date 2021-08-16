import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  List _posts = [];

  List get posts => _posts;

  void setPostList(posts){
    _posts = posts;
    notifyListeners();
  }
}