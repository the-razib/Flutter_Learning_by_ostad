import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/splas_screen_controller.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_ber_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/asstes_path.dart';
import 'package:task_manager/ui/widgets/background_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String name = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenController splashScreenController =
      Get.put(SplashScreenController());

  Future<void> _moveToNextScreen() async {
    final bool result = await splashScreenController.moveToNextScreen();
    if (result) {
      Get.offAllNamed(MainBottomNavBerScreen.name);
    } else {
      Get.offAllNamed(SignInScreen.name);
    }
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsPath.logoSVG,
                width: 140,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
