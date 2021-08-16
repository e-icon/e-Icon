import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier {
  Map<String, String> _user = {
    'name': "",
    'email': "",
    'imgUrl': "",
  };

  Map<String, String> get user => _user;

  void setUser(user){
    _user = user;
    notifyListeners();
  }
}