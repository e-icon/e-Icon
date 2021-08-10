import 'package:flutter/material.dart';
import './Tab1/tab1.dart';
import './Tab2/game_tab.dart';
import './Tab3/tab3.dart';

void main() {
  runApp(MyApp());
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

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: menu(),
        body: TabBarView(
          children: <Widget>[
            Tab1(),
            GameTab(),
            Tab3()
          ],
        ),
      ),
    );
  }
}

Widget menu() {
  return Container(
    color: Colors.blue,
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.indigo,
        tabs: [
          Tab(text: "Tab1",
              icon: Icon(Icons.menu_book)
          ),
          Tab(text: "Game",
              icon: Icon(Icons.videogame_asset)
          ),
          Tab(text: "Tab3",
              icon: Icon(Icons.person)
          ),
        ],
      ),
  );
}

