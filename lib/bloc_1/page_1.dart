import 'package:bloc_1/bloc_1/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bloc1 extends StatefulWidget {
  const Bloc1({Key? key}) : super(key: key);

  @override
  State<Bloc1> createState() => _Bloc1State();
}

class _Bloc1State extends State<Bloc1> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('BLoC'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
                  if (state is InitialCounterState) {
                    return const Text('There is no value');
                  } else if (state is CalculatingCounterState) {
                    return const CircularProgressIndicator();
                  } else if (state is ValueCounterState) {
                    return Column(
                      children: [
                        const Text(
                          'You have pushed the button this many times:',
                        ),
                        Text(
                          '${state.counter}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
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
