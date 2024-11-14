import 'package:get/get.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';

class CompletedTaskController extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;
  bool get inProgress => _inProgress;
  List<TaskModel> _completedTaskList=[];
  String? get errorMessage=>_errorMessage;
  List<TaskModel> get completedTaskList=>_completedTaskList;

  Future<bool> getCompletedTaskList() async {
    bool isSuccess=false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.completedTaskList);

    if (response.isSuccess) {
      final TaskListModel taskListModel =
      TaskListModel.fromJson(response.responseData);
      _completedTaskList = taskListModel.taskList ?? [];
      isSuccess=true;
    } else {
      _errorMessage=response.errorMessage;
    }

    _inProgress=false;
    update();
    return isSuccess;
  }


}