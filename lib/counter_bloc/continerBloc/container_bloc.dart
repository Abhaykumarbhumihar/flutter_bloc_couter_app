import 'package:bloc_counter/counter_bloc/continerBloc/container_evennt.dart';
import 'package:bloc_counter/counter_bloc/counter_event.dart';
import 'package:bloc_counter/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'container_state.dart';

class ContainerBloc extends Bloc<ContainerEvent,ContainerState>{
  ContainerBloc():super(ContainerState(isCounterVisible: true)){
    on<ContainerShowEvent>((event, emit) => emit(ContainerState(isCounterVisible: true)));
        on<ContainerHideEvent>((event, emit) => emit(ContainerState(isCounterVisible: false)));
  }
}