part of 'home_cubit.dart';

// home state.dart
enum Status { initial, fetching, success, failed }

class HomeState {
  List<dynamic> data;
  Status status;
  String error;

  HomeState({required this.data, required this.status, required this.error});

  factory HomeState.initial() =>
      HomeState(data: [], status: Status.initial, error: '');

  HomeState copyWith({
    List<dynamic>? data,
    Status? status,
    String? error,
  }) {
    return HomeState(
      data: data ?? this.data,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
