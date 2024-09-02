// enum: Defines a type with a fixed set of constant values.
enum DeviceType { mobile, tablet, desktop }

class ScreenUtilis {
  static const double mobileDisplayMaxSize = 640;
  static const double tabletDisplayMaxSize = 1008;
  static const double dektopDisplayMinSize = 1008;

  static DeviceType getDeviceType(double width) {
    if (width < ScreenUtilis.mobileDisplayMaxSize) {
      return DeviceType.mobile;
    } else if (width >= ScreenUtilis.mobileDisplayMaxSize &&
        width < ScreenUtilis.dektopDisplayMinSize) {
      return DeviceType.tablet ;
    } else {
      return DeviceType.desktop;
    }
  }
}
