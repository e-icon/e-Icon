import 'package:flutter/material.dart';
import './Component/title1.dart';

class Title1 extends StatelessWidget {
  const Title1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Title1"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: () { Navigator.pop(context, false); },
          ),
        ),
        body: Center(
          child: Title1View(),
        )
    );
  }
}

class Title2 extends StatelessWidget {
  const Title2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Title2"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: () { Navigator.pop(context, false); },
          ),
        ),
        body: Center(
          child: const Text("Hello!"),
        )
    );
  }
}

class Title3 extends StatelessWidget {
  const Title3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Title3"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: () { Navigator.pop(context, false); },
          ),
        ),
        body: Center(
          child: const Text("Hello!"),
        )
    );
  }
}
