import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Color box_color = Colors.blueAccent;

  Widget _buildListItem(BuildContext context, DocumentSnapshot documnent) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(documnent['message'])),
          )
        ],
      ),
      onTap: () {
        List list = [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.amber,
          Colors.teal
        ];
        box_color = list[Random().nextInt(4)];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.lightBlue,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase List'),
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('messages').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();//const Text('Loading...');
              return ListView.builder(
                itemExtent: 80.0,
                itemCount: snapshot.data.document.length,
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.document[index]),
              );
            }
        ),
      ),
    );
  }


}

/*
Widget _buildBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('baby').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();

      return _buildList(context, snapshot.data.documents);
    },
  );
}


*/