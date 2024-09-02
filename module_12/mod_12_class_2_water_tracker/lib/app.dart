import 'package:flutter/material.dart';
import 'package:mod_12_class_2_water_tracker/home_screen.dart';

class WaterTrackApp extends StatelessWidget {
  const WaterTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
