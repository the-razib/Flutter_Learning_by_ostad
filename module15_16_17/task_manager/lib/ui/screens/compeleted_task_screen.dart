import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/task_card.dart';

class CompeletedTaskScreen extends StatelessWidget {
  const CompeletedTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, int index) {
          // return const TaskCard();
        },
        separatorBuilder: (context, int index) {
          return SizedBox(height: 8);
        },
        itemCount: 10);
  }
}
