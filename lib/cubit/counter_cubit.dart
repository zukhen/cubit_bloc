import 'package:bloc/bloc.dart';
import 'package:cubit_bloc/home/home_screen.dart';
import 'package:flutter/material.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  //emit giống trong môn server
  void incrementState() => emit(state.copyWith(counter: state.counter + 1));
  void decrementState() => emit(state.copyWith(counter: state.counter - 1));

  void navigateToHomeScree(BuildContext context) {
    if (state.counter == 10) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
    // if(checkState().)
  }
}
