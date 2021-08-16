import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../providers/userInfo.dart';
import 'content_page.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final titleController = TextEditingController();
  final contentsController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    contentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> addPost() {
      CollectionReference posts = _firestore.collection('Posts');
      Map<String, String> user = context.read<UserInfoProvider>().user;
      return posts
          .add({
        'email': user['email'],
        'title': titleController.text,
        'contents': contentsController.text,
      })
          .then((value) => print("Post Uploaded"))
          .catchError((error) => print("Failed to upload post: $error")
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Page"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width - 50,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                width: MediaQuery.of(context).size.width - 50,
                height: 50,
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  width: MediaQuery.of(context).size.width - 50,
                  child: TextField(
                    controller: contentsController,
                    maxLines: 15,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contents',
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                  onPressed: (){
                    addPost();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ContentPage()),
                    );
                    // final snackBar = SnackBar(content: Text('title: ${titleController.text}, contents: ${contentsController.text}'));
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
