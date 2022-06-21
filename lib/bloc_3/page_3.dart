import 'package:bloc_1/bloc_3/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bloc3 extends StatefulWidget {
  const Bloc3({Key? key}) : super(key: key);

  @override
  State<Bloc3> createState() => _Bloc3State();
}

class _Bloc3State extends State<Bloc3> {
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
                BlocConsumer<CounterBloc, CounterState>(
                  listenWhen: (previous, current) => current is ValueCounterState,
                  listener: (context, state) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Value has been changed'),
                    ),
                  ),
                  builder: (context, state) {
                    if (state is InitialCounterState) {
                      return Text('There is no value');
                    } else if (state is CalculatingCounterState) {
                      return CircularProgressIndicator();
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
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              final buttonEnabled = state is! CalculatingCounterState;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: buttonEnabled ? () => context.read<CounterBloc>().add(CounterAdd()) : null,
                    child: const Icon(Icons.add),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: buttonEnabled ? () => context.read<CounterBloc>().add(CounterSubtract()) : null,
                    child: const Icon(Icons.remove),
                  ),
                ],
              );
            },
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
