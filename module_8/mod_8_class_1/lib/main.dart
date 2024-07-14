import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),

      /// <<< Colum >>>
      /*
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text('Hello my name is razib'),
        Text('Hello'),
        Text('Hello'),
        ElevatedButton(onPressed: () {}, child: Text('Click')),
        IconButton(onPressed: () {}, icon: Icon(Icons.ice_skating))
      ]),*/

      /// <<< Row >>>
      /*body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('hello \n New Hellow'),
              Text('hello'),
              Text('hello'),
              ElevatedButton(onPressed: (){}, child: Text('Button')),
              ElevatedButton(onPressed: (){}, child: Text('Button')),
              ElevatedButton(onPressed: (){}, child: Text('Button')),
              ElevatedButton(onPressed: (){}, child: Text('Button')),
            ],
          ),
      ),

       */

      /// <<< Multiple Row and Colum
      body: Row(
        children: [
          Column(
            children: [Text('This is a row')],
          ),
          Column(
            children: [Text('This is a row')],
          ),
          Column(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    );
  }
}
