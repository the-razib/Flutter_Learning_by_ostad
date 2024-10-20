import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widgets/centerted_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snackber_message.dart';
import 'package:task_manager/ui/widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  void initState() {
    _getProgressTaskList();
    super.initState();
  }
  bool _addProgressTaskListInProgress = false;
  List<TaskModel> _progressTaskList=[];
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        await _getProgressTaskList();
      },
      child: Visibility(
        visible: !_addProgressTaskListInProgress,
        replacement: const CentertedCircularProgressIndicator(),
        child: ListView.separated(
            itemBuilder: (context, int index) {
              return  TaskCard(taskModel: _progressTaskList[index],);
            },
            separatorBuilder: (context, int index) {
              return const SizedBox(height: 8);
            },
            itemCount: _progressTaskList.length),
      ),
    );
  }

  Future<void> _getProgressTaskList() async {
    _progressTaskList.clear();
    _addProgressTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.progressTaskList);

    if(response.isSuccess) {
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData);
      _progressTaskList=taskListModel.taskList ?? [];
    }else {
      showSnackBerMessage(context, response.errorMessage);
    }

    _addProgressTaskListInProgress=false;
    setState(() {});
  }

}
