import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_18_class_1_basic_getx/counter_controller.dart';
import 'package:module_18_class_1_basic_getx/home_screen.dart';

void main(){
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomeScreen(),
      initialBinding: ControllerBlinder(),
    );
  }
}
class ControllerBlinder extends Bindings{
  @override
  void dependencies() {
    Get.put(CounterController());
  }

}
