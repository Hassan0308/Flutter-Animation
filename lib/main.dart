import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_animation/bloc/task_bloc/task_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/tasks/list_of_tasks_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TaskBloc>(
        create: (BuildContext context) => TaskBloc(),
      ),
      BlocProvider<CounterBloc>(
        create: (BuildContext context) => CounterBloc(),
      ),
    ],
    child: MaterialApp(
      home: TaskListScreen(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Center(
                child: Text(state.counter.toString()),
              );
            }),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Increment());
                },
                child: Text("Increment"
                    "")),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Decrement());
                },
                child: Text("Decrement"
                    "")),
          ],
        ),
      ),
    );
  }
}
