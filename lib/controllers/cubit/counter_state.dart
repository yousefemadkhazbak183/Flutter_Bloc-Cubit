part of 'counter_cubit.dart';

sealed class CounterState {
  final int count; 
  CounterState(this.count);
}

class CounterInitState extends CounterState {
  CounterInitState(): super(0);
}

class CounterUpdateState extends CounterState {
  CounterUpdateState(super.count);

}