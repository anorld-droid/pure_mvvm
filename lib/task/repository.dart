import 'package:pure_mvvm/task/model.dart';

class TaskRepository {
  //Private Constructor
  TaskRepository._private();

  //Singleton instance
  static final TaskRepository _instance = TaskRepository._private();

  //Factory constructor to return the instance
  factory TaskRepository() {
    return _instance;
  }

  final List<Task> _taskList = [
    Task(
        0,
        "Study MVVM",
        "In order to avoid ugly state management librares and collect continuously technical debt, I should study proper state management patterns",
        false),
  ];

  void addTask(Task task) {
    task.id = _taskList.length;
    _taskList.add(task);
  }

  void removeTask(Task task) {
    _taskList.remove(task);
  }

  void updateTask(Task task) {
    _taskList[_taskList.indexWhere((element) => element.id == task.id)] = task;
  }

  Future<List<Task>> loadTasks() async {
    // Simulate a http request
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(_taskList);
  }
}
