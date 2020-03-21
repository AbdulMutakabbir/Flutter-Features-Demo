import 'dart:async';
import 'package:flutter/material.dart';
import './../models/note.dart';
import './../utils/database_helper.dart';
import './../screens/note_detail.dart';
import 'package:sqflite/sqflite.dart';


class NoteList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }

    return Scaffold(

      appBar: AppBar(
        title: Text('Notes'),
      ),

      body: getNoteListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Note('', '', 2), 'Add Note');
        },

        tooltip: 'Add Note',

        child: Icon(Icons.add),

      ),
    );
  }

  ListView getNoteListView() {

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          margin: getPriorityMargin(this.noteList[position].priority),
          color: Colors.green[300],
          elevation: 5.0,
          child: ListTile(

            leading: CircleAvatar(
              backgroundColor: getPriorityColor(this.noteList[position].priority),
              child: getPriorityIcon(this.noteList[position].priority),
            ),

            title: Text(this.noteList[position].title, style: titleStyle,),

            subtitle: Text(this.noteList[position].date),

            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.white54,),
              onTap: () {
                _delete(context, noteList[position]);
              },
            ),
            //selected: false,
            onLongPress:() {
              _delete(context, noteList[position]);
            },
            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.noteList[position],'Edit Note');
            },

          ),
        );
      },
    );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.white54;
        break;
      case 2:
        return Colors.white70;
        break;
      case 3:
        return Colors.white24;
        break;

      default:
        return Colors.white12;
    }
  }
  EdgeInsets getPriorityMargin(int priority) {
    switch (priority) {
      case 1:
        return EdgeInsets.only(left: 80,top: 5,bottom: 5);
        break;
      case 2:
        return EdgeInsets.only(right: 80,top: 5,bottom: 5);
        break;
      case 3:
        return EdgeInsets.only(left: 80,top: 5,bottom: 5);
        break;

      default:
        return EdgeInsets.only(right: 80,top: 5,bottom: 5);
    }
  }

  // Returns the priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.star);
        break;
      case 3:
        return Icon(Icons.check);
        break;
      case 2:
        return Icon(Icons.check_circle);
    }
  }

  void _delete(BuildContext context, Note note) async {

    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {

    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}