import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/cancelled_task_screen.dart';
import 'package:task_manager/ui/screens/compeleted_task_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/screens/progress_task_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/task_manager_app_ber.dart';

class MainBottomNavBerScreen extends StatefulWidget {
  const MainBottomNavBerScreen({super.key});

  @override
  State<MainBottomNavBerScreen> createState() => _MainBottomNavBerScreenState();
}

class _MainBottomNavBerScreenState extends State<MainBottomNavBerScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const NewTaskScreen(),
    const CompeletedTaskScreen(),
    const CancelledTaskScreen(),
    const ProgressTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskManagerAppBer(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'New',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_box),
            label: 'Completed',
          ),
          NavigationDestination(
            icon: Icon(Icons.close),
            label: 'Cancelled',
          ),
          NavigationDestination(
            icon: Icon(Icons.access_time_filled_outlined),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}

