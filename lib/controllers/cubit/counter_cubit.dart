
import 'package:flutter_bloc/flutter_bloc.dart';

part  'counter_state.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterInitState());

  void increment(){
    emit(CounterUpdateState(state.count +1));
    
   
  }

  void decrement(){
    emit(CounterUpdateState(state.count -1));
  }

}