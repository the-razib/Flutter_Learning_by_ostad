import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_18_class_02_navigator/profile%20Screen.dart';

class SettingScreen extends StatelessWidget {
  static const String name='setting';
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Setting'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.pop(context);
              Get.back();
            },
            child: Text('Home Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.pop(context);
              /*Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                  builder: (builder) => ProfileScreen(),
              ),
              );*/
              Get.off(ProfileScreen());
            },
            child: Text('Profile Screen'),
          ),
        ],
      ),
    );
  }
}
