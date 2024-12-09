import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  // Check if location permission is granted
  static Future<bool> isLocationPermissionGranted() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  // Request location permission
  static Future<bool> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  // Check if GPS service is enabled
  static Future<bool> checkGPSServiceEnable() async {
    return Geolocator.isLocationServiceEnabled();
  }

  static Future<Position?> getCurrentLocationWithTimeout({
    Duration timeout = const Duration(seconds: 30),
  }) async {
    try {
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings( accuracy: LocationAccuracy.high),
      ).timeout(
        timeout,
        onTimeout: () {
          debugPrint('Location fetch timed out');
          return Position(
            longitude: 0,
            latitude: 0,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          );
        },
      );
    } catch (e) {
      debugPrint('Error getting location: $e');
      return null;
    }
  }

  // Get location stream with error handling
  static Stream<Position> getLocationStreamWithHandling({
    LocationSettings? locationSettings,
  }) {
    locationSettings ??= const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    return Geolocator.getPositionStream(locationSettings: locationSettings)
        .handleError((error) {
      debugPrint('Location stream error: $error');
    });
  }
}
