import 'package:flutter/material.dart';

import './messageBubble.dart';

class Messanger extends StatelessWidget {
  TextEditingController _msgContrroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[400],
          elevation: 3.0,
          leading: Padding(
            padding: EdgeInsets.all(5),
            child:
              /*IconButton(
                padding: EdgeInsets.all(0.0),
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),*/
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('lib/assets/images/dp_1.jpg')
                    ),
                    borderRadius: BorderRadius.circular(25)
                ),
              ),

          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Sam',style: TextStyle(fontSize: 32.0),),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info_outline),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.phone),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.block),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.9],
                  colors: [Colors.amber[400], Colors.green[700]])),
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('lib/assets/images/doodle_bg_1.jpg'))),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Bubble(
                      message: 'Hi there, this is a message',
                      time: '12:00',
                      delivered: true,
                      isMe: false,
                    ),
                    Bubble(
                      message: 'Whatsapp like bubble talk',
                      time: '12:01',
                      delivered: true,
                      isMe: false,
                    ),
                    Bubble(
                      message: 'Just to ckeck if it works',
                      time: '12:00',
                      delivered: false,
                      isMe: true,
                    ),
                    Bubble(
                      message: 'Nice one, Flutter is awesome',
                      time: '12:00',
                      delivered: true,
                      isMe: true,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3.0),
                      topRight: Radius.circular(3.0),
                    ),
                    color: Colors.green[400],
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            maxLines: 5,
                            minLines: 1,
                            cursorColor: Colors.amber,
                            controller: _msgContrroler,
                            decoration: InputDecoration(
                              hintText: 'Type a nice Message...',
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(style: BorderStyle.none)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.redAccent[700],
                                      width: 4)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.amberAccent[700],
                                      width: 4)),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        color: Colors.white,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MsgBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
