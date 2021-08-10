import 'package:flutter/material.dart';
import './game_view.dart';

class GameTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 40.0),
                width: MediaQuery.of(context).size.width - 100,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Title1()),
                    );
                  },
                  child: const Text("Title1"),
                ),
              )
            ),
            Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  width: MediaQuery.of(context).size.width - 100,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Title2()),
                      );
                    },
                    child: const Text("Title2"),
                  ),
                )
            ),
            Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  width: MediaQuery.of(context).size.width - 100,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Title3()),
                      );
                    },
                    child: const Text("Title3"),
                  ),
                )
            ),
          ],
        );
  }

}

