import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './providers/counts.dart';
import './widgets/buttons.dart';
import './widgets/counts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counts()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
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

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late User currentUser;
  String name = "";
  String email = "";
  String url = "";

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

    setState(() {
      email = user!.email!;
      url = user.photoURL!;
      name = user.displayName!;
    });

    return 'Google Login Success: $user';
  }

  void googleSignOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();

    setState(() {
      email = "";
      url = "";
      name = "";
    });

    print("User Sign Out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            email == ""
                ? Container()
                : Column(
              children: <Widget>[
                Image.network(url),
                Text(name),
                Text(email),
              ],
            ),
            OutlinedButton(
              onPressed: () {
                if (email == "") {
                  googleSingIn();
                } else {
                  googleSignOut();
                }
              },
              child: Container(
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.play_arrow_outlined),
                      Expanded(child: Text(email == "" ? 'Google Login' : "Google Logout"))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

