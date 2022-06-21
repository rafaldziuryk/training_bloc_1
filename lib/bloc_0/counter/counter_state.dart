part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;

  @override
  List<Object> get props => [counter];

  const CounterState({
    required this.counter,
  });
}
