
import 'package:flutter/material.dart';
import './screens/note_list.dart';
import './screens/note_detail.dart';

class ListApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'NoteKeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: NoteList(),
    );
  }
}