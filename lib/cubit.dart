import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tekamovie/model.dart';
import 'package:tekamovie/states.dart';

class MovieCubit extends Cubit<MoviesState> {
  MovieCubit() : super(MoviesState());

  static MovieCubit get(context) => BlocProvider.of(context);

  int pageNumber = 1;
  List<Movie> allList = [];

  getMovie() async {
    emit(MovieLoadingState());
    try {
      final res = await Dio().get(
          "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$pageNumber");
      var model = MoviesData.fromJson(res.data);
      allList = model.list;
      emit(MovieSuccesState());
    } catch (e) {
      emit(MovieErrState());
    }
  }
}
