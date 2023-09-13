import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final _dio = Dio();
  HomeCubit() : super(HomeState.initial());

  Future<void> fetchData() async {
    emit(state.copyWith(status: Status.fetching));
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        final responseData = response.data;
        emit(state.copyWith(status: Status.success, data: responseData));
      }
    } catch (e) {
      emit(state.copyWith(status: Status.failed));
      print(Exception(e));
    }
  }
}
