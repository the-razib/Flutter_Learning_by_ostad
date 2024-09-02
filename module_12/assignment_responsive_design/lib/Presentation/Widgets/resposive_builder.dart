import 'package:flutter/material.dart';
import 'package:responsive_design/Presentation/Utils/screen_utilis.dart';

class ResposiveBuilder extends StatelessWidget {
  const ResposiveBuilder({
    super.key,
    required this.mobile,
    required this.desktop,
    this.tablet,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final DeviceType diviceType = ScreenUtilis.getDeviceType(size.width);
    if (diviceType == DeviceType.mobile) {
      return mobile;
    } else if (diviceType == DeviceType.tablet ) {
      return tablet ?? mobile;
    } else {
      return desktop;
    }
  } }
