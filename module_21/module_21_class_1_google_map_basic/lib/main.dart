import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:module_21_class_1_google_map_basic/home_screen.dart';

void main()async{
  // await dotenv.load(fileName: ".env");
  runApp(MapApp());
}

class MapApp extends StatelessWidget {
  const MapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
