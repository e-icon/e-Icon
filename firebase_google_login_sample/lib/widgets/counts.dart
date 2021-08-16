import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counts.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width - 100;

    print('Counter');

    return Text(
      context.watch<Counts>().count.toString(),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}