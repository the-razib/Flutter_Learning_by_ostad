import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widgets/centerted_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snackber_message.dart';
import 'package:task_manager/ui/widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  void initState() {
    _getCompletedTaskList();
    super.initState();
  }

  bool _addCompletedTaskListInProgress = false;
  List<TaskModel> _completedTaskList = [];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await _getCompletedTaskList();
      },
      child: Visibility(
        visible: !_addCompletedTaskListInProgress,
        replacement: CentertedCircularProgressIndicator(),
        child: ListView.separated(
            itemBuilder: (context, int index) {
              return TaskCard(
                taskModel: _completedTaskList[index],
                onRefreshList: () {
                  _getCompletedTaskList();
                },
              );
            },
            separatorBuilder: (context, int index) {
              return const SizedBox(height: 8);
            },
            itemCount: _completedTaskList.length),
      ),
    );
  }

  Future<void> _getCompletedTaskList() async {
    _completedTaskList.clear();
    _addCompletedTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.completedTaskList);

    if (response.isSuccess) {
      final TaskListModel taskListModel =
          TaskListModel.fromJson(response.responseData);
      _completedTaskList = taskListModel.taskList ?? [];
    } else {
      showSnackBerMessage(context, response.errorMessage);
    }

    _addCompletedTaskListInProgress = false;
    setState(() {});
  }
}
