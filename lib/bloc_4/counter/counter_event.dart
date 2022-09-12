part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class CounterAdd extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class CounterSubtract extends CounterEvent {
  @override
  List<Object?> get props => [];
}
