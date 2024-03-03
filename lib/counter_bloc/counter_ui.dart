import 'package:bloc_counter/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/counter_bloc/counter_event.dart';
import 'package:bloc_counter/counter_bloc/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPaageOne extends StatelessWidget {
  CounterPaageOne({super.key});

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
                buildWhen: (previcious, current) {
              return true;
            }, builder: (context, state) {
              return state.isCounterVisible
                  ? Text(state.count.toString())
                  : SizedBox();
            }),
          )
        ],
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecrementEvent());
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.minimize),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncrementEvent());
                  //counterBloc.add(CounterIncrementEvent());
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  /// I need to hide here counter;
                  context
                      .read<CounterBloc>()
                      .add(CounterToggleVisibilityEvent(false));
                },
                tooltip: 'Decrement',
                child: Text("Hide Counter text"),
              ),
              FloatingActionButton(
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(CounterToggleVisibilityEvent(true));

                  //I need to show here counter text
                },
                tooltip: 'Increment',
                child: Text("Show Counter text"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
