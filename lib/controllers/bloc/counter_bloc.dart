import 'package:bloc_cubit/controllers/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitState()) {
    on<IncrementEvent>((event, emit) {
      emit(CounterUpdateState(state.count + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterUpdateState(state.count - 1));
    });
  }
}
