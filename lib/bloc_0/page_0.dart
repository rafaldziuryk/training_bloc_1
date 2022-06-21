import 'package:bloc_1/bloc_0/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bloc0 extends StatefulWidget {
  const Bloc0({Key? key}) : super(key: key);

  @override
  State<Bloc0> createState() => _Bloc0State();
}

class _Bloc0State extends State<Bloc0> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('BLoC'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) => Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(CounterAdd()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
