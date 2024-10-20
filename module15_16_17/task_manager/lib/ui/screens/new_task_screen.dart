import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/centerted_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snackber_message.dart';
import 'package:task_manager/ui/widgets/task_card.dart';
import 'package:task_manager/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _addNewTaskListInProgress = false;
  List<TaskModel> _newTaskList=[];

  @override
  void initState() {
    _getNewTaskList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {await _getNewTaskList(); },
        child: Column(
          children: [
            _buildSummarySection(),
            Expanded(
              child: Visibility(
                visible: !_addNewTaskListInProgress,
                replacement:const CentertedCircularProgressIndicator(),
                child: ListView.separated(
                    itemBuilder: (context, int index) {
                      return  TaskCard(taskModel: _newTaskList[index],);
                    },
                    separatorBuilder: (context, int index) {
                      return SizedBox(height: 8);
                    },
                    itemCount: _newTaskList.length),
              ),
            ),
          ],
        ),
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

  Future<void> _onTabFAButton() async {
    final bool? shouldRefresh = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTaskScreen(),
      ),
    );
    if(shouldRefresh== true) {
      _getNewTaskList();
    }
  }

  Future<void> _getNewTaskList() async {
    _newTaskList.clear();
    _addNewTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.newTaskList);

    if(response.isSuccess) {
     final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData);
     _newTaskList=taskListModel.taskList ?? [];
    }else {
      showSnackBerMessage(context, response.errorMessage);
    }

    _addNewTaskListInProgress=false;
    setState(() {});
  }
}
