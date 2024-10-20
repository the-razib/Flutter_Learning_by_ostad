import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/ui/utils/app_colors.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key, required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    // Parse the createdDate
    DateTime createdDate = DateTime.parse(
        widget.taskModel.createdDate.toString());

    // String formattedDate = DateFormat('yMMMd').add_jm().format(createdDate);
    // Format the date to show time first, then date
    String formattedDate = DateFormat('h:mm a, MMM d, y').format(createdDate);

    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.taskModel.title ?? '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(widget.taskModel.description ?? ''),
            Text('Date: $formattedDate'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTaskStatusChip(),
                Wrap(
                  children: [
                    IconButton(
                        onPressed: _onTabEditButton, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTabEditButton() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ['New', 'Completed', 'Cancelled', 'Progress'].map((e) {
              return ListTile(
                title: Text(e),

              );
            }).toList(),
          ),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: const Text('Cancel')),
            TextButton(onPressed: () {}, child: const Text('Okay')),
          ],
        );
      },
    );
  }

  void _onTabDeleteButton() {}

  Widget _buildTaskStatusChip() {
    return Chip(
      label: const Text(
        'New',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      side: const BorderSide(color: AppColor.themeColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );
  }
}
