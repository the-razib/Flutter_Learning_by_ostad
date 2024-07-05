import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(IntroApp());
}

class IntroApp extends StatelessWidget {
  const IntroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      title: 'Intro app', // app title
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.lightGreenAccent,
      ),

      // body Text
      /* body: const Center(
        child: Text('Hello This is a third class by ostad teamp',
        style: TextStyle(
          fontSize: 18,
        ),),
      ),*/

      //Icon
      body: Center(
        //<< Icon Show >>
        /*child: Icon(
            Icons.account_circle_outlined,
            size: 100,
            color: Colors.deepOrangeAccent,
          ),
           */

        // display image From Url
        /*child: Image.network('https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
           */

        //Display image from local folder
        // go to pubspec.yaml and add folder location
        /*child: Image.asset(
          'asset/images/nature.jpeg',
          height: 200,
          width: 200,
          fit: BoxFit.contain,
        ),*/

        //<< ElevatedButton >>
        /*child: ElevatedButton(
          onPressed: () {
            print('Button pressed');
            },
          child: Text(
            'Click',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
     */
        // <<< IconButton>>>
        /* child: IconButton(
          onPressed: (){
            print('click');
          },
          icon: Icon(Icons.add_alarm_outlined,size: 100,),
        ),*/

        // <<< anything can be a button >>>
        // <<< GestureDetector >>>
        /*child: GestureDetector(
        onDoubleTap: () {
          print('Double tab detection');
        },
        onTap: () {
          print('single tap detection');
        },
        child: Image.asset(
          'asset/images/nature.jpeg',
          height: 200,
          width: 200,
          fit: BoxFit.contain,
        ),
      ) */
        child: InkWell(
          onTap: () {
            print('single tab detection');
          },
          onDoubleTap: () {
            print('double tab detection');
          },
          child: Text('InkWell Button'),
        ),
      ),
    );
  }
}
