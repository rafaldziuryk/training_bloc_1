import 'package:bloc_1/bloc_2/counter/counter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<CounterBloc, CounterState>(
    'bloc created should not return data',
    build: () => CounterBloc(),
    expect: () => [],
  );

  blocTest<CounterBloc, CounterState>(
    'bloc return 1 after add event',
    build: () => CounterBloc(),
    act: (bloc) => bloc.add(CounterAdd()),
    wait: const Duration(milliseconds: 2100),
    expect: () => [
      CalculatingCounterState(),
      const ValueCounterState(1),
    ],
  );

  blocTest<CounterBloc, CounterState>(
    'bloc return 1 after add event',
    build: () => CounterBloc(),
    act: (bloc) => bloc.add(CounterAdd()),
    wait: const Duration(milliseconds: 2100),
    expect: () => [
      CalculatingCounterState(),
      const ValueCounterState(1),
    ],
  );

  blocTest<CounterBloc, CounterState>(
    'bloc return 0 after add and subtract event',
    build: () => CounterBloc(),
    act: (bloc) {
      bloc.add(CounterAdd());
      bloc.add(CounterSubtract());
    },
    wait: const Duration(milliseconds: 2100),
    expect: () => [
      CalculatingCounterState(),
      const ValueCounterState(1),
      const ValueCounterState(0),
    ],
  );

  blocTest<CounterBloc, CounterState>(
    'bloc return 0 after add and subtract event with waiting after each action',
    build: () => CounterBloc(),
    act: (bloc) async {
      bloc.add(CounterAdd());
      await Future.delayed(const Duration(milliseconds: 2100));
      bloc.add(CounterSubtract());
      await Future.delayed(const Duration(milliseconds: 2100));
    },
    expect: () => [
      CalculatingCounterState(),
      const ValueCounterState(1),
      CalculatingCounterState(),
      const ValueCounterState(0),
    ],
  );

  test('bloc return 0 after add and subtract event with waiting after each action - with fake async', () {
    fakeAsync(
      (async) {
        final bloc = CounterBloc();
        expectLater(
            bloc.stream,
            emitsInOrder([
              CalculatingCounterState(),
              const ValueCounterState(1),
              CalculatingCounterState(),
              const ValueCounterState(0),
            ]));
        bloc.add(CounterAdd());
        async.elapse(const Duration(milliseconds: 2100));
        bloc.add(CounterSubtract());
        async.elapse(const Duration(milliseconds: 2100));
      },
    );
  });
}
