import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tekamovie/model.dart';
import 'package:tekamovie/states.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieInitState());

  static MovieCubit get(context) => BlocProvider.of(context);

  int page = 1;
  List<Results> allList = [];
  MovieData? model;

  void getMovie() async {
    emit(MovieLoadingState());
    try {
      final response = await Dio().get(
          "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$page");
      var model = MovieData.fromJson(response.data);
      allList = model.results;
      emit(MovieSuccessState());
    } catch (e) {
      emit(MovieErrState());
    }
  }
}
