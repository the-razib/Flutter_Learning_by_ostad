import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(23.80732623303042, 90.3686790524852),
            zoom: 16,
            tilt: 50),
        onTap: (LatLng? latlng) {
          print(latlng);
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        markers: <Marker>{
          Marker(
            rotation: 0,
            markerId: MarkerId('home'),
            position: LatLng(23.80732623303042, 90.3686790524852),
            infoWindow: InfoWindow(
                title: 'Home',
                onTap: () {
                  print('Home Tap');
                }),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueMagenta,
            ),
            draggable: true,
            onDragStart: (LatLng startLatLang) {
              print('on start drag: $startLatLang');
            },
            onDragEnd: (LatLng stopLatLang) {
              print('on stop drag: $stopLatLang');
            },
          ),
        },
        circles: <Circle>{
          Circle(
              circleId: CircleId('1'),
              center: LatLng(23.80511617326318, 90.36898948252201),
              fillColor: Colors.green,
              radius: 500,
              strokeWidth: 5,
              // strokeColor: Colors.blue.withAlpha(100)
              strokeColor: Colors.blue.withOpacity(0.5),
              zIndex: 2),
          Circle(
              circleId: CircleId('2'),
              center: LatLng(23.80511617326318, 90.36898948252201),
              fillColor: Colors.red,
              radius: 250,
              strokeWidth: 5,
              // strokeColor: Colors.blue.withAlpha(100)
              strokeColor: Colors.blue.withOpacity(0.5),
              zIndex: 1),
        },
        polylines: <Polyline>{
          Polyline(
              polylineId: PolylineId('1'),
              color: Colors.red.withOpacity(0.5),
              width: 15,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              points: const [
                LatLng(23.81210134310172, 90.37052638828754),
                LatLng(23.811248615470962, 90.37162978202105),
                LatLng(23.810912123926002, 90.36991316825151)
              ],
              jointType: JointType.round
              // patterns: [
              //   PatternItem.dash(1),
              //   PatternItem.dot,
              //   PatternItem.gap(2),
              // ],
              )
        },
        polygons: <Polygon>{
          Polygon(
              polygonId: PolygonId('1'),
              fillColor: Colors.blue.withOpacity(0.5),
              strokeWidth: 1,
              points: const <LatLng>[
                LatLng(23.814531892852457, 90.36717463284731),
                LatLng(23.814083146367786, 90.3701176866889),
                LatLng(23.81258751803905, 90.36958627402782),
                LatLng(23.811951656066768, 90.3681556507945),
                LatLng(23.813372755733273, 90.36684773862362)
              ],
              holes: const [
                [
                  LatLng(23.81379880654152, 90.36780428141356),
                  LatLng(23.813462321606018, 90.36891605705023),
                  LatLng(23.81336508741938, 90.36814760416746),
                ]
              ])
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(23.80732623303042, 90.3686790524852),
                zoom: 16
              ),
            ),
          );
        },
        backgroundColor: Colors.yellow,
        child: Icon(
          CupertinoIcons.location,
        ),
      ),
    );
  }
}
