import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_design/Presentation/Screens/home_screen.dart';
import 'package:window_manager/window_manager.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
//     await windowManager.ensureInitialized();
//
//     WindowOptions windowOptions =
//         WindowOptions(size: Size(1000, 600), center: true, title: 'RSA');
//     windowManager.waitUntilReadyToShow(windowOptions, () async {
//       await windowManager.show();
//       await windowManager.focus();
//     });
//   }
//   runApp(RSAApp());
// }
void main(){
  runApp(RSAApp());
}
class RSAApp extends StatelessWidget {
  const RSAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
