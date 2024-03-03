import 'package:bloc_counter/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/counter_bloc/counter_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc/continerBloc/container_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (contet) => CounterBloc()),
          BlocProvider(create: (contet) => ContainerBloc()),
        ],
        child: CounterPaageOne(),
      ),
    );
  }
}
