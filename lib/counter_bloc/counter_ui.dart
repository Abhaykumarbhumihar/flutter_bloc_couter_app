import 'package:bloc_counter/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/counter_bloc/counter_event.dart';
import 'package:bloc_counter/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPaageOne extends StatelessWidget {
  CounterPaageOne({super.key});

  final counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page one"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
                bloc: counterBloc,
                buildWhen: (previcious, current) {
                  return true;
                },
                builder: (context, state) {
                  return Text(state.count.toString());
                }),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrementEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
