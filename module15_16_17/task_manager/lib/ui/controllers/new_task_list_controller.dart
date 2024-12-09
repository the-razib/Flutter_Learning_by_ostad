import 'package:get/get.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';

class NewTaskListController extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;
  List<TaskModel> taskList=[];

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> getNewTaskList() async {
    taskList.clear();
    bool isSuccess=false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.newTaskList);

    if (response.isSuccess) {
      final TaskListModel taskListModel =
      TaskListModel.fromJson(response.responseData);
      taskList = taskListModel.taskList ?? [];
      isSuccess=true;
    } else {
      _errorMessage=response.errorMessage;
    }

    _inProgress=false;
    update();
    return isSuccess;
  }

}