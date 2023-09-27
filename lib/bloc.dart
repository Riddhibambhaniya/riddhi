import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

// Bloc
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield state + 1;
    } else if (event is DecrementEvent) {
      yield state - 1;
    }
  }
}


class MyHomePage63 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter App'),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text('Counter: $count'),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _counterBloc.add(IncrementEvent());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.add(DecrementEvent());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
