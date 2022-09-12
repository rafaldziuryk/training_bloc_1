import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(InitialCounterState()) {
    on<CounterAdd>((event, emit) async {
      final calculatingState = CalculatingCounterState();
      emit(calculatingState);
      await Future.delayed(const Duration(seconds: 2));
      counter++;
      final state = ValueCounterState(counter);
      emit(state);
    });

    on<CounterSubtract>((event, emit) async {
      final calculatingState = CalculatingCounterState();
      emit(calculatingState);
      await Future.delayed(const Duration(seconds: 2));
      counter--;
      final state = ValueCounterState(counter);
      emit(state);
    });
  }
}
