part of 'counter_cubit.dart';

class CounterState {
  //khởi tạo giá trị, ví dụ đếm
  int counter;

  CounterState({required this.counter});

  //khoi tao gia trị cho CounterState

  factory CounterState.initial() => CounterState(counter: 0);

  CounterState copyWith({int? counter}) =>
      CounterState(counter: counter ?? this.counter);
}
