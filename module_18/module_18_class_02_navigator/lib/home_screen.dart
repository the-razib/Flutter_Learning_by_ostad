import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_18_class_02_navigator/counter_controller.dart';
import 'package:module_18_class_02_navigator/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String name='/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GetBuilder<CounterController>(
              builder: (counterController) {
                return Text(
                  '${counterController.counter}',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // use default navigator
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingScreen(),
                ),
              );*/
              // Get.to(()=>const SettingScreen());
              // Get.to(() => SettingScreen(), transition: Transition.fadeIn, duration: Duration(milliseconds: 500), );
              // Navigator.pushNamed(context, '/setting');
              Navigator.pushNamed(context, SettingScreen.name);
            },
            child: const Text('Setting'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.showSnackbar(GetSnackBar(
                title: 'Hello',
                message: 'This is the message',
              ),);

            },
            child: const Text('Show Snackber'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Get.find<CounterController>().increase();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
