import 'package:flutter/material.dart';

import './tab_1.dart';
import './tab_2.dart';
import './tab_3.dart';
import './tab_4.dart';


class TabPage extends StatefulWidget{

  @override
  TabPageState createState() => TabPageState();
}

class TabPageState extends State<TabPage> with SingleTickerProviderStateMixin{

  TabController _controler;

  @override
  void initState(){
    super.initState();
    _controler = TabController(length: 4, vsync: this);
  }

  @override
  void dispose(){
    _controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Tab View Example'),
        bottom: TabBar(
          indicatorColor: Colors.white,
          isScrollable: true,

          controller: _controler,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.chat)),
            Tab(icon: Icon(Icons.bug_report)),
            Tab(icon: Icon(Icons.details)),
            Tab(icon: Icon(Icons.headset)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controler,
        children: <Widget>[
          Tab_1(),
          Tab_2(),
          Tab_3(),
          Tab_4(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.teal,
        child: TabBar(
          indicatorColor: Colors.white70,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          controller: _controler,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.chat)),
            Tab(icon: Icon(Icons.bug_report)),
            Tab(icon: Icon(Icons.details)),
            Tab(icon: Icon(Icons.headset)),
          ],
        ),
      ),
    );
  }

}