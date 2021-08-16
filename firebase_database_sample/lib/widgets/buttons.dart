import 'package:firebase_database_sample/pages/content_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../providers/userInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  // google login
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late User currentUser;

  // db
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // functions
    Future<void> addUser() {
      CollectionReference users = _firestore.collection('Users');
      Map<String, String> user = context.read<UserInfoProvider>().user;
      return users
          .doc(user['email'])
          .set(user)
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error")
      );
    }

    Future<String> googleSingIn() async {
      final GoogleSignInAccount account = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      assert(!user!.isAnonymous);

      currentUser = _auth.currentUser!;
      assert(user!.uid == currentUser.uid);

      var data = {
        'name': user!.displayName!,
        'email': user.email!,
        'imgUrl': user.photoURL!,
      };
      context.read<UserInfoProvider>().setUser(data); // set user info

      addUser();  // add user to firestore
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ContentPage()),
      );
      return 'Google Login Success: $user';
    }

    void googleSignOut() async {
      await _auth.signOut();
      await googleSignIn.signOut();

      var data = {
        'name': "",
        'email': "",
        'imgUrl': "",
      };
      context.read<UserInfoProvider>().setUser(data);

      print("User Sign Out");
    }

    return OutlinedButton(
      onPressed: () {
        if (context.read<UserInfoProvider>().user["email"] == "") {
          googleSingIn();
        } else {
          googleSignOut();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        }
      },
      child: Container(
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.play_arrow_outlined),
            Expanded(
                child: Text(context.watch<UserInfoProvider>().user["email"] == ""
                ? 'Google Login'
                : "Google Logout")
            )
          ],
        )
      ),
    );
  }
}


