import 'package:flutter/material.dart';
import 'package:module_21_class_3_geolocator/home_screen.dart';
void main(){
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
