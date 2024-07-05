import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: PageActivity(),
    );
  }
}

class PageActivity extends StatelessWidget {
  const PageActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        titleSpacing: 16,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        backgroundColor: Colors.blue,
        //centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 0.7,
        elevation: 3,
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.message)),
          IconButton(onPressed: (){}, icon:Icon(Icons.search)),
          IconButton(onPressed: (){}, icon:Icon(Icons.safety_check_outlined)),
          IconButton(onPressed: (){}, icon:Icon(Icons.settings)),
        ],
      ),
      body: Text(
        'Hi My name is Razib',
      ),
      //backgroundColor: Colors.pinkAccent,
    );
  }
}
