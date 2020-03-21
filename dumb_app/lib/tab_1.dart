import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tab_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [Colors.red[700], Colors.blue[300]],
            stops: [0.0,1.0]),
      ),
      child: Opacity(
        opacity: 0.3,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('lib/assets/images/doodle_bg_1.jpg'),
            ),
          ),
        ),
      )/*Center(
          child: Icon(
        Icons.chat_bubble_outline,
        size: 50,
      )),*/
    );
  }
}
