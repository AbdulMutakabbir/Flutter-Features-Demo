import 'package:flutter/material.dart';
import 'dart:io';

import './page2.dart';
import './tab.dart';
import './listHome.dart';
import './messageBubble.dart';
import './messagePage.dart';
import './listView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String title = 'test';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _str = '';
  bool _visibility = true;
  TextEditingController _textControler = TextEditingController();

  void _incrementCounter() async{
    setState(() {
      _counter++;
     Future.delayed(Duration(seconds: 2), () =>
     widget.title = "new "+_counter.toString());
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _sqrCounter() {
    setState(() {
      _counter = _counter * _counter;
    });
  }

  void _rootCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.tab),
                color: Colors.teal,
                iconSize: 70,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TabPage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.note_add),
                color: Colors.green,
                iconSize: 50,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListApp()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.chat),
                color: Colors.purple,
                iconSize: 50,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BubbleScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.all_inclusive),
                color: Colors.pink[300],
                iconSize: 50,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Messanger()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.short_text),
                color: Colors.amber,
                iconSize: 50,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Messanger()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.format_list_numbered),
                color: Colors.lightBlue,
                iconSize: 50,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListPage()),
                  );
                },
              ),
              Text(
                'You have pushed the button this many times: ' + '$_counter',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'String is: ' + "$_str",
                style: Theme.of(context).textTheme.body2,
              ),
              Text(
                "Visisbility is: " + '$_visibility',
                style: Theme.of(context).textTheme.body2,
              ),
              RaisedButton.icon(
                  onPressed: _decrementCounter,
                  //child: Icon(Icons.delete),
                  //padding: EdgeInsets.all(0.0),
                  textColor: Colors.red,
                  label: Text("label"),
                  icon: Icon(Icons.star)),
              IconButton(
                icon: Icon(Icons.star),
                onPressed: _sqrCounter,
                color: Colors.blueAccent,
                iconSize: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: TextField(
                        controller: _textControler,
                        textDirection: TextDirection.rtl,
                        onSubmitted: (String _str) {
                          setState(() {
                            this._str = _str;
                          });
                        },
                        obscureText: _visibility,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        _textControler.clear();
                      }),
                  IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _visibility = !_visibility;
                        });
                      },
                      color: Colors.green)
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _decrementCounter,
                    child: Icon(Icons.delete),
                    //padding: EdgeInsets.all(15.0),
                  ),
                  RaisedButton(
                      onPressed: _incrementCounter,
                      child: Icon(Icons.add_circle)),
                  RaisedButton(onPressed: _sqrCounter, child: Icon(Icons.star)),
                ],
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    children: <Widget>[
                      Text('Next Page'),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Page2(str: _textControler.text)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _rootCounter;
          setState(() {
            _str = null;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
