part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

//Create Task Event
class CreateTask extends TaskEvent {
  final TaskModel task;

  CreateTask({required this.task});
}

//TooglTaskCompleteEvent
class TooglTaskCompleteEvent extends TaskEvent {
  final TaskModel task;

  TooglTaskCompleteEvent({required this.task});
}

//TooglTaskCompleteEvent
class RemoveTaskEvent extends TaskEvent {
  final TaskModel task;

  RemoveTaskEvent({required this.task});
}
