import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/task_card.dart';
import 'package:task_manager/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSummarySection(),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, int index) {
                  return const TaskCard();
                },
                separatorBuilder: (context, int index) {
                  return SizedBox(height: 8);
                },
                itemCount: 10),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTabFAButton,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TaskSummaryCard(
              title: 'New',
              count: 09,
            ),
            TaskSummaryCard(
              title: 'Completed',
              count: 09,
            ),
            TaskSummaryCard(
              title: 'Cancelled',
              count: 09,
            ),
            TaskSummaryCard(
              title: 'Progress',
              count: 09,
            ),
          ],
        ),
      ),
    );
  }

  void _onTabFAButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewTaskScreen(),
      ),
    );
  }
}

