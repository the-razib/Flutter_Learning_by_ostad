import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(IntroApp());
}

// here we create a widget name IntroApp
class IntroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Home'),
        ),
        body: const Center(
          child: Text(
            'My name is md razib . I study in daffodil international univeristy',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              fontSize: 20,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              letterSpacing: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
