import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppBody());
}

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('AppBody'),
        ),
        body:
        // Work on single Container
        // Container(
        //   height: 300,
        //   width: 300,
        //   margin: EdgeInsets.all(60),
        //   padding: EdgeInsets.all(25),
        //   decoration: BoxDecoration(
        //       color: Colors.green,
        //       border: Border.all(
        //         color: Colors.black54,
        //         width: 20,
        //       )),
        //   child: Image.network('https://picsum.photos/250?image=9'),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Container(height: 100,width: 100,child: Image.network('https://picsum.photos/250?image=9'),),
            Container(height: 100,width: 100,child: Image.network('https://picsum.photos/250?image=9'),),
            Container(height: 100,width: 100,child: Image.network('https://picsum.photos/250?image=9'),),
          ],)

      ),
    );
  }
}
