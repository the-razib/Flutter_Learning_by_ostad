import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_18_class_02_navigator/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const String name='profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Setting'),
          ),
          ElevatedButton(
            onPressed: () {
              /*Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (builder) => HomeScreen(),
                ),(route) => false,
              );*/
              // Get.offAll(HomeScreen());
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
            child: Text('Home Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            child: Text('Profile Screen'),
          ),
        ],
      ),
    );
  }
}
