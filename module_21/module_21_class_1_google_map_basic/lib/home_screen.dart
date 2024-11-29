import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GoogleMap(

        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(23.80732623303042, 90.3686790524852),
          zoom: 15,
        ),
        onTap: (LatLng? latlng){
          print((jsonEncode(latlng)));
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        // markers: {
        //   Marker(
        //     markerId: MarkerId('1'),
        //     position: LatLng(23.80732623303042, 90.3686790524852),
        //     infoWindow: InfoWindow(
        //       title: 'My Location'
        //     ),
        //   ),
        //   Marker(
        //     markerId: MarkerId('2'),
        //     position: LatLng(23.80732623303042, 95.3686790524852),
        //     infoWindow: InfoWindow(
        //       title: 'My Location'
        //     ),
        //   ),
        //
        // },
        circles: {
          Circle(
            circleId: CircleId('1'),
            center: LatLng(23.80732623303042, 90.3686790524852),
            radius: 100,
            strokeWidth: 2,
            strokeColor: Colors.red,
            fillColor: Colors.red.withAlpha(70),

          )
        },
        polylines: {
          Polyline(
            polylineId: PolylineId('1'),
            points: [
              LatLng(23.80732623303042, 90.3686790524852),
              LatLng(23.80732623303042, 91.3686790524852),
            ],
            color: Colors.red,
            width: 1,

          )
        },
        polygons: {
          Polygon(
            polygonId: PolygonId('1'),
            points: [
              LatLng(23.80732623303042, 90.3686790524852),
              LatLng(23.80732623303042, 91.3686790524852),
              LatLng(23.80732623303042, 92.3686790524852),

            ],
            strokeColor: Colors.black,
            strokeWidth: 5,
            fillColor: Colors.red.withAlpha(70),
          )
        },
      ),
    );
  }
}
