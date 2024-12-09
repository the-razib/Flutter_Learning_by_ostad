import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';

class LocationTrackerScreen extends StatefulWidget {
  const LocationTrackerScreen({super.key});

  @override
  _LocationTrackerScreenState createState() => _LocationTrackerScreenState();
}

class _LocationTrackerScreenState extends State<LocationTrackerScreen> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  final List<LatLng> _polylineCoordinates = [];
  final Set<Polyline> _polylines = {};

  LatLng? currentPosition;
  Position? position;
  StreamSubscription? _locationSubscription;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  Future<void> _initializeLocation() async {
    try {
      final isGranted = await LocationService.isLocationPermissionGranted();
      if (isGranted) {
        final isServiceEnable = await LocationService.checkGPSServiceEnable();
        if (isServiceEnable) {
          // Attempt to get current location first
          await _fetchInitialLocation();

          // Then start listening to location updates
          _startLocationUpdates();
        } else {
          await Geolocator.openLocationSettings();
        }
      } else {
        final result = await LocationService.requestLocationPermission();
        if (result) {
          await _initializeLocation();
        } else {
          await Geolocator.openAppSettings();
        }
      }
    } catch (e) {
      debugPrint('Location initialization error: $e');
      _showLocationErrorDialog();
    }
  }

  Future<void> _fetchInitialLocation() async {
    try {
      Position? currentLocation = await LocationService.getCurrentLocationWithTimeout();

      if (currentLocation != null && mounted) {
        setState(() {
          position = currentLocation;
          currentPosition = LatLng(
              currentLocation.latitude,
              currentLocation.longitude
          );
          _updateMapAndMarker(currentLocation);
        });
      }
    } catch (e) {
      debugPrint('Error fetching initial location: $e');
    }
  }

  void _startLocationUpdates() {
    _locationSubscription?.cancel();

    _locationSubscription = LocationService.getLocationStreamWithHandling(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
        timeLimit: Duration(seconds: 10),
      ),
    ).listen(
          (Position pos) {
        if (mounted) {
          setState(() {
            currentPosition = LatLng(pos.latitude, pos.longitude);
            _updateMapAndMarker(pos);
          });
        }
      },
      onError: (error) {
        debugPrint('Location stream error: $error');
        _showLocationErrorDialog();
      },
      cancelOnError: true,
    );
  }

  void _updateMapAndMarker(Position position) {
    LatLng newLocation = LatLng(position.latitude, position.longitude);

    // Update marker
    _markers.clear();
    _markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: newLocation,
        infoWindow: InfoWindow(
          title: 'My Current Location',
          snippet: 'Lat: ${position.latitude}, Lon: ${position.longitude}',
        ),
        onTap: () {
          // Optional: Additional marker tap actions
        },
      ),
    );

    // Update polyline
    if (currentPosition != null) {
      _polylineCoordinates.add(currentPosition!);
    }
    _polylineCoordinates.add(newLocation);

    _polylines.clear();
    _polylines.add(
      Polyline(
        polylineId: const PolylineId('location_path'),
        color: Colors.blue,
        width: 5,
        points: _polylineCoordinates,
      ),
    );

    // Animate camera to new location
    _animateToLocation(newLocation);
  }

  void _animateToLocation(LatLng location) {
    try {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: location,
            zoom: 15,
          ),
        ),
      );
    } catch (e) {
      debugPrint('Camera animation error: $e');
    }
  }

  void _showLocationErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Error'),
        content: const Text(
            'Unable to retrieve location. '
                'Please check your device settings and try again.'
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _initializeLocation();
            },
            child: const Text('Retry'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _initializeLocation,
          ),
        ],
      ),
      body: currentPosition == null
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Fetching location...'),
          ],
        ),
      )
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentPosition!,
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        markers: _markers,
        polylines: _polylines,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
