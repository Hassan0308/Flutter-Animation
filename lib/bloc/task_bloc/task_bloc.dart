import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/task_model.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState([])) {
    on<CreateTask>(_createTask);
    on<TooglTaskCompleteEvent>(_tooglTaskToComplete);
    on<RemoveTaskEvent>(_removeTask);
  }

  void _createTask(CreateTask event, Emitter<TaskState> emit) {
    List<TaskModel> updatedList = List.of(state.listOfTask);
    updatedList.add(event.task);
    emit(TaskState(updatedList));
  }

  void _tooglTaskToComplete(
      TooglTaskCompleteEvent event, Emitter<TaskState> emit) {
    List<TaskModel> updatedList = List.of(state.listOfTask);
    final index =
        updatedList.indexWhere((element) => element.id == event.task.id);
    print(index != -1);
    if (index != -1) {
      updatedList[index].isComplete = !updatedList[index].isComplete;
      emit(TaskState(updatedList));
    }
  }

  void _removeTask(RemoveTaskEvent event, Emitter<TaskState> emit) {
    List<TaskModel> updatedTasks = List.of(state.listOfTask);
    updatedTasks.removeWhere((task) => task.id == event.task.id);
    emit(TaskState(updatedTasks));
  }
}
