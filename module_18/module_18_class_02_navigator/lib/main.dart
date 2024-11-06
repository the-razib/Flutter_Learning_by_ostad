import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:module_18_class_02_navigator/counter_controller.dart';
import 'package:module_18_class_02_navigator/home_screen.dart';
import 'package:module_18_class_02_navigator/profile%20Screen.dart';
import 'package:module_18_class_02_navigator/setting_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        // '/': (context) => const HomeScreen(),
        // '/setting': (context) => const SettingScreen(),
        // '/profile': (context) => const ProfileScreen(),
        HomeScreen.name : (context)=> const HomeScreen(),
        SettingScreen.name : (context) =>const SettingScreen(),
        ProfileScreen.name : (context) =>const SettingScreen()
      },
      initialBinding: ControllerBlinders(),
    );
  }
}

class ControllerBlinders extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterController());
  }
}
