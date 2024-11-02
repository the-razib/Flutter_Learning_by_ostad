import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widgets/centerted_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snackber_message.dart';
import 'package:task_manager/ui/widgets/task_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  @override
  void initState() {
    _getCancelledTaskList();
    super.initState();
  }

  bool _addCancelledTaskListInProgress = false;
  List<TaskModel> _cancelledTaskList = [];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await _getCancelledTaskList();
      },
      child: Visibility(
        visible: !_addCancelledTaskListInProgress,
        replacement: CentertedCircularProgressIndicator(),
        child: ListView.separated(
            itemBuilder: (context, int index) {
              return TaskCard(
                taskModel: _cancelledTaskList[index],
                onRefreshList: () {
                  _getCancelledTaskList();
                },
              );
            },
            separatorBuilder: (context, int index) {
              return const SizedBox(height: 8);
            },
            itemCount: _cancelledTaskList.length),
      ),
    );
  }

  Future<void> _getCancelledTaskList() async {
    _cancelledTaskList.clear();
    _addCancelledTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.cancelledTaskList);

    if (response.isSuccess) {
      final TaskListModel taskListModel =
          TaskListModel.fromJson(response.responseData);
      _cancelledTaskList = taskListModel.taskList ?? [];
    } else {
      showSnackBerMessage(context, response.errorMessage);
    }

    _addCancelledTaskListInProgress = false;
    setState(() {});
  }
}
