import 'package:flutter/material.dart';

class Title1View extends StatefulWidget {
  const Title1View({Key? key}) : super(key: key);

  @override
  _Title1ViewState createState() => _Title1ViewState();
}

class _Title1ViewState extends State<Title1View> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: _dragTarget(),
            ),
          ), // drop view
          Align(
            alignment: Alignment.bottomCenter,
            child: _itemBar(), // drag view
          )
        ],
      ),
    );
  }

  Widget _itemBar(){
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _item(text: 'red', color: Colors.red),
          _item(text: 'green', color: Colors.green),
          _item(text: 'blue', color: Colors.blue),
          _item(text: 'grey', color: Colors.grey),
          _item(text: 'yellow', color: Colors.yellow),
        ],
      ),
    );
  }

  Widget _item({required String text, required Color color}){
    var item = new Item(text: text, color: color);

    return Draggable<Item>(
        data: item,
        feedback: Container(
            color: item.color,
            child: Text(item.text)
        ),
        child:  Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: OutlinedButton(
            onPressed: () {
            },
            child: Text(item.text),
          ),
        ),
    );
  }

  Widget _dragTarget(){
    var color = Colors.white;

    return DragTarget<Item>(
        builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
          return Container(
                color: color,
                child: Center(child: Text("here!!!!!"),),

          );
        },
        onAccept: (item){
          void _showToast(BuildContext context) {
            final scaffold = ScaffoldMessenger.of(context);
            scaffold.showSnackBar(
              SnackBar(
                content: Text(item.text),
                duration: Duration(milliseconds: 300),
              ),
            );
          }
          _showToast(context);

          color = item.color;

        }

    );
  }
}

class Item {
  const Item({
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;
}

