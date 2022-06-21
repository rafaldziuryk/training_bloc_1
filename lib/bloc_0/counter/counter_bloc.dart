import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(const CounterState(counter: 0)) {
    on<CounterAdd>((event, emit) {
      counter++;
      final state = CounterState(counter: counter);
      emit(state);
    });
  }
}
