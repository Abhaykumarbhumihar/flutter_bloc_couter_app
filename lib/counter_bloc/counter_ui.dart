import 'package:bloc_counter/counter_bloc/continerBloc/container_bloc.dart';
import 'package:bloc_counter/counter_bloc/continerBloc/container_evennt.dart';
import 'package:bloc_counter/counter_bloc/continerBloc/container_state.dart';
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
          ),
           BlocBuilder<ContainerBloc,ContainerState>(

            builder: (context, state) {
              return 
              Visibility(
                visible: state.isCounterVisible,
                child: Container(
              
              width: 300,
              height: 300,
              color: Colors.amber,
                       ));
            },
             
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
                tooltip: 'Hide Counter text',
                child: Text("Hide Counter text"),
              ),
              FloatingActionButton(
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(CounterToggleVisibilityEvent(true));

                  //I need to show here counter text
                },
                tooltip: 'Show Counter text',
                child: Text("Show Counter text"),
              )
            ],
          ),
        SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  /// I need to hide here counter;
                  context
                      .read<ContainerBloc>()
                      .add(ContainerHideEvent());
                },
                //tooltip: 'Hide Counter text',
                child: Text("Hide Container "),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<ContainerBloc>()
                      .add(ContainerShowEvent());

                  //I need to show here counter text
                },
               // tooltip: 'Show Counter text',
                child: Text("Show Container "),
              )
            ],
          ),

        ],
      ),
    );
  }
}
