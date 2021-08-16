import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database_sample/pages/content_page.dart';
import 'package:firebase_database_sample/pages/upload_page.dart';
import 'package:firebase_database_sample/providers/posts.dart';
import 'package:firebase_database_sample/widgets/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/userInfo.dart';
import './widgets/buttons.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserInfoProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
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
  // db
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    void getPost(){
      var posts = [];
      _firestore.collection('Posts').get()
          .then((QuerySnapshot querySnapshot) {
        posts.addAll(querySnapshot.docs);
        print(posts[0]['email']);
      });

      context.read<PostProvider>().setPostList(posts);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Google Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Profile(),
            LoginButton(),
          ],
        ),
      ),
    );
  }
}

