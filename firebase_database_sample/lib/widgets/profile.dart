import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/userInfo.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserInfoProvider>().user;

    return user["email"] == ""
        ? Container()
        : Column(
      children: <Widget>[
        Image.network(user["imgUrl"]!),
        Text(user["name"]!),
        Text(user["email"]!),
      ],
    );
  }
}
