import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/task_bloc/task_bloc.dart';


class TaskListScreen extends StatelessWidget {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task List')),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.listOfTask.length,
            itemBuilder: (context, index) {
              if(state.listOfTask.length==0){
                counter=0;
              }
              final task = state.listOfTask[index];
              return ListTile(
                title: Text(task.title??""),
                subtitle: Text(task.description??""),
                leading: Checkbox(
                  value: task.isComplete,
                  onChanged: (_) {
                    BlocProvider.of<TaskBloc>(context).add(TooglTaskCompleteEvent(task: task));
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    BlocProvider.of<TaskBloc>(context).add(RemoveTaskEvent(task: task));
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new task

          TaskModel newTask = TaskModel(
            id: UniqueKey().toString(),
            title: 'Task ${++counter}',
            description: 'Description of the new task',
          );
          BlocProvider.of<TaskBloc>(context).add(CreateTask(task: newTask));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

