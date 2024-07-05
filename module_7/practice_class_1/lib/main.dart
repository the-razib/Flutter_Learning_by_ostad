import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(IntroApp());
}

class IntroApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.blueAccent,
        ),
        body:  Center(
          child: Text(
            'This is demo practice , Here we learn about basic flutter widget like MaterialApp,Scaffold,Appbar',
             textAlign: TextAlign.end,
            maxLines: 2,
            style: TextStyle(
              backgroundColor: Colors.blueAccent,
              letterSpacing: 1,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              wordSpacing: 2,
              overflow: TextOverflow.ellipsis,
              decoration: TextDecoration.overline,
            ) ,
          ),
        ),
      ),
    );
  }
}
