part of 'counter_bloc.dart';


class CounterState extends Equatable {
  final int counter;

  CounterState({required this.counter});


  @override
  // TODO: implement props
  List<Object?> get props => [counter];

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }
}


