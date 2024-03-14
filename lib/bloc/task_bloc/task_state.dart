part of 'task_bloc.dart';

@immutable
class TaskState {
  final List<TaskModel> listOfTask;

  TaskState(this.listOfTask);

  TaskState copyWith({List<TaskModel>? tasks}) {
    return TaskState(tasks ?? this.listOfTask);
  }
}
