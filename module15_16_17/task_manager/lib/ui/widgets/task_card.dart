import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/app_colors.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title of the task',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Description of task'),
            Text('Date: 12-12-12'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTaskStatusChip(),
                Wrap(
                  children: [
                    IconButton(onPressed:_onTabEditButton, icon: Icon(Icons.edit)),
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
          content:Column(
            mainAxisSize: MainAxisSize.min,
            children: ['New','Completed','Cancelled','Progress'].map((e){
              return ListTile(
                title: Text(e),

              );
            }).toList(),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Cancel')),
            TextButton(onPressed: (){}, child: const Text('Okay')),
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
