import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  Bubble({this.message, this.time, this.delivered, this.isMe});

  final String message, time;
  final delivered, isMe;

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? [Colors.amber[900],Colors.amber[700] ] : [Colors.green[800],Colors.green[500]];
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = delivered ? Icons.done_all : Icons.done;
    final radius = isMe
        ? BorderRadius.only(
      topRight: Radius.circular(8.0),
      bottomLeft: Radius.circular(20.0),
      bottomRight: Radius.circular(20.0),
    )
        : BorderRadius.only(
      topLeft: Radius.circular(20.0),
      bottomLeft: Radius.circular(10.0),
      bottomRight: Radius.circular(20.0),
    );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0,1.0],
              colors: bg
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(0))
            ],
            color: Colors.red,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0,left: 10.0),
                child: Text(message,style: TextStyle(color: Colors.white),),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 12.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class BubbleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        elevation: 2,
        bottomOpacity: 1.0,
        title: Text(
          'Sam',
          style: TextStyle(
              fontSize:35,
              //textBaseline: TextBaseline.ideographic,
              fontWeight: FontWeight.w300,
              //fontFamily: 'Nunito',
              color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.videocam,
              color: Colors.purple[700],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.call,
              color: Colors.purple[700],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.purple[700],
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:4,right:4,top:8,bottom:16),
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
                  message: 'Nice one, Flutter is awesome',
                  time: '12:00',
                  delivered: true,
                  isMe: true,
                ),
                Bubble(
                  message: 'I\'ve told you so dude!',
                  time: '12:00',
                  delivered: true,
                  isMe: false,
                ),
                Bubble(
                  message: 'Yup totally Agree',
                  time: '12:00',
                  delivered: true,
                  isMe: true,
                ),
                Bubble(
                  message: 'good mate',
                  time: '12:00',
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
                  message: 'Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph.',
                  time: '12:00',
                  delivered: false,
                  isMe: true,
                ),
                Bubble(
                  message: 'Before you can begin to determine what the composition of a particular paragraph will be, you must first decide on an argument and a working thesis statement for your paper. What is the most important idea that you are trying to convey to your reader? The information in each paragraph must be related to that idea. In other words, your paragraphs should remind your reader that there is a recurrent relationship between your thesis and the information in each paragraph. A working thesis functions like a seed from which your paper, and your ideas, will grow. The whole process is an organic one—a natural progression from a seed to a full-blown paper where there are direct, familial relationships between all of the ideas in the paper.',
                  time: '12:00',
                  delivered: false,
                  isMe: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}