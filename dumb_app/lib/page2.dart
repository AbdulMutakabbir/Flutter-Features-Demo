import 'package:flutter/material.dart';


class Page2 extends StatelessWidget{
  final String str;

  Page2({Key key,this.str,}):super (key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
                'Second Page',
              style: TextStyle(fontSize: 25)
            ),
            Text(
              str,
              style: TextStyle(fontSize: 50)
            ),
            RaisedButton(
              color: Colors.redAccent,
              textColor: Colors.white,
              elevation: 3,
              child: Text('Alert'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext) {
                      return AlertDialog(
                        title: Text('Alert Title'),
                        //backgroundColor: Colors.green,
                        actions: <Widget>[
                          Text('Text for alert appers here.'),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('ok'),
                          )
                        ],
                      );
                    }
                );
              },
            ),
          ],
        )
      )
    );
  }

}