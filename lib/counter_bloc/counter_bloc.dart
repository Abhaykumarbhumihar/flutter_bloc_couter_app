import 'package:bloc_counter/counter_bloc/counter_event.dart';
import 'package:bloc_counter/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  bool? isCounterVisible;
  CounterBloc():super(CounterState(count: 0,isCounterVisible: true)){
    isCounterVisible=true;
    on<CounterIncrementEvent>((event, emit) => emit(CounterState(count: state.count+1,isCounterVisible: isCounterVisible!)));
        on<CounterDecrementEvent>((event, emit) => emit(CounterState(count: state.count-1,isCounterVisible: isCounterVisible!)));

on<CounterToggleVisibilityEvent>((event, emit) {
  isCounterVisible = event.isVisible;
        emit(CounterState(
            count: state.count, isCounterVisible: event.isVisible));
            
}
            );

  }


}