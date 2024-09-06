import 'package:flutter/material.dart';
import 'cart_page.dart'; // Make sure to import the CartPage file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Bag',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CartPage(), // Set CartPage as the home screen
    );
  }
}
