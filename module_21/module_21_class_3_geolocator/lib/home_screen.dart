import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? position;
  @override
  void initState() {
    listenCurrentLocation();
    super.initState();
  }

  Future<void> listenCurrentLocation() async{
    final isGranted = await isLocationPermissionGranted();
    if (isGranted) {
      final isServiceEnable = await checkGPSServiceEnable();
      if (isServiceEnable) {
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            // timeLimit: Duration(seconds: 3),
            distanceFilter: 10
          )
        ).listen((pos){
          print(pos); // listen current location
        });
      } else {
        Geolocator.openLocationSettings();
      }
    } else {
      final result = await requestLocationPermission();
      if (result) {
        getCurrentLocation();
      } else {
        Geolocator.openAppSettings();
      }
    }
  }
  Future<void> getCurrentLocation() async {
    final isGranted = await isLocationPermissionGranted();
    if (isGranted) {
      final isServiceEnable = await checkGPSServiceEnable();
      if (isServiceEnable) {
        Position currentPosition = await Geolocator.getCurrentPosition();
        position = currentPosition;
        setState(() {});
        print(position);
      } else {
        Geolocator.openLocationSettings();
      }
    } else {
      final result = await requestLocationPermission();
      if (result) {
        getCurrentLocation();
      } else {
        Geolocator.openAppSettings();
      }
    }
  }

  Future<bool> isLocationPermissionGranted() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> requestLocationPermission() async {
    LocationPermission locationPermission =
        await Geolocator.requestPermission();
    if (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkGPSServiceEnable() async {
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              getCurrentLocation();
            },
            child: const Text('Get My Location'),
          ),
          Text('My Location: $position')
        ],
      )),
    );
  }
}
