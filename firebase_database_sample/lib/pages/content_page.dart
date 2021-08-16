import 'package:firebase_database_sample/pages/upload_page.dart';
import 'package:firebase_database_sample/providers/posts.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contents List Page"),
        actions: [
          IconButton(
              onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => UploadPage()));
          },
              icon: Icon(Icons.upload)
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('Posts').snapshots(), // get data from firestore
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text(doc['title']),
                        subtitle: Text(doc['email']),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 200,
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 10
                          ),
                          child: Text(
                            doc['contents'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )


                    ],
                  )

                );
              }).toList(),
            );
        },
      ),

    );
  }
}
