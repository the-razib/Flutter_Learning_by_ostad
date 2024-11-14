import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/controllers/chang_task_status_controller.dart';
import 'package:task_manager/ui/controllers/task_delet_controller.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/centerted_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snackber_message.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.taskModel,
    required this.onRefreshList,
  });

  final TaskModel taskModel;
  final VoidCallback onRefreshList;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  String _selectedStatus = '';

  final TaskDeleteController taskDeleteController =
      Get.find<TaskDeleteController>();
  final ChangeTaskStatusController changeTaskStatusController =
      Get.find<ChangeTaskStatusController>();

  @override
  void initState() {
    _selectedStatus = widget.taskModel.status!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Parse the createdDate
    DateTime createdDate =
        DateTime.parse(widget.taskModel.createdDate.toString());

    // String formattedDate = DateFormat('yMMMd').add_jm().format(createdDate);
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
                    GetBuilder<ChangeTaskStatusController>(
                      builder: (controller) {
                        return Visibility(
                          visible: !controller.inProgress,
                          replacement: const CenterCircularProgressIndicator(),
                          child: IconButton(
                              onPressed: _onTabEditButton,
                              icon: const Icon(Icons.edit)),
                        );
                      }
                    ),
                    GetBuilder<TaskDeleteController>(builder: (controller) {
                      return Visibility(
                        visible: !controller.inProgress,
                        replacement: const CenterCircularProgressIndicator(),
                        child: IconButton(
                          onPressed: () {
                            _onTabDeleteButton();
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    }),
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
                onTap: () {
                  _changesStatues(e);
                  Navigator.pop(context);
                },
                title: Text(e),
                selected: _selectedStatus == e,
                trailing: _selectedStatus == e
                    ? const Icon(
                        Icons.check,
                        size: 24,
                      )
                    : null,
              );
            }).toList(),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
          ],
        );
      },
    );
  }

  Future<void> _onTabDeleteButton() async {
    final bool result =
        await taskDeleteController.onTabDeleteButton(widget.taskModel.sId!);

    if (result) {
      widget.onRefreshList();
    } else {
      showSnackBerMessage(taskDeleteController.errorMessage!);
    }
  }

  Widget _buildTaskStatusChip() {
    return Chip(
      label: Text(
        widget.taskModel.status!,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      side: const BorderSide(color: AppColor.themeColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );
  }

  Future<void> _changesStatues(String newStatus) async {
    final bool result = await changeTaskStatusController.changesStatues(
      widget.taskModel.sId!,
      newStatus,);
    if (result) {
      widget.onRefreshList();
    } else {
      showSnackBerMessage(changeTaskStatusController.errorMessage!);
    }
  }
}
