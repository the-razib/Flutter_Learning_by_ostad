import 'package:flutter/material.dart';
import 'package:mod_12_class_2_water_tracker/water_track.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassNoTEController =
      TextEditingController(text: '1');

  List<WaterTracker> waterTrackList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Water Tracker'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildWaterTrackCounter(),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: _buildWaterTrackListView())
        ],
      ),
    );

  }

  Widget _buildWaterTrackListView() {
    return ListView.separated(
      itemCount: waterTrackList.length,
      itemBuilder: (context, index) {
        return _buildWaterTrackListTile(index);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  ListTile _buildWaterTrackListTile(int index) {
    WaterTracker waterTracker=waterTrackList[index];
    return ListTile(
          //here Show the Time
          title: Text(
              '${waterTracker.dateTime.hour}:${waterTracker.dateTime.minute}'),
          // Here Show date day-month-year
          subtitle: Text(
              '${waterTracker.dateTime.day}/${waterTracker.dateTime.month}/${waterTracker.dateTime.year}'),
          leading: CircleAvatar(child: Text('${waterTracker.noOfGlass}')),
          trailing: IconButton(
              onPressed: ()=>_onTabDeletButton(index),
              icon: const Icon(Icons.delete_outline_outlined)));
  }

  Widget _buildWaterTrackCounter() {
    return Column(
      
      children: [
        Text(
          getTotalGlassCount().toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Glass/s',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              child: TextField(
                controller: _glassNoTEController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(onPressed: _onTabAddWaterTrack, child: const Text('Add')),
          ],
        )
      ],
    );
  }

  int getTotalGlassCount() {
    int counter = 0;
    for (WaterTracker t in waterTrackList) {
      counter += t.noOfGlass;
    }
    return counter;
  }

  void _onTabAddWaterTrack() {
    if (_glassNoTEController.text.isEmpty) {
      _glassNoTEController.text = '1';
    }
    final int noOfGlass = int.parse(_glassNoTEController.text) ?? 1;
    WaterTracker waterTracker =
        WaterTracker(noOfGlass: noOfGlass, dateTime: DateTime.now());
    waterTrackList.add(waterTracker);
    setState(() {});
  }

  void _onTabDeletButton(int index) {
    waterTrackList.removeAt(index);
    setState(() {});
  }

  @override
  void dispose() {
    _glassNoTEController.dispose();
    super.dispose();
  }
}

