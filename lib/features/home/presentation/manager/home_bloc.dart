import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/home/domain/use_cases/get_all_movie.dart';
import 'package:movie_app/features/home/domain/use_cases/get_movie_by_category.dart';

import '../../../../core/di_handler/app_di_handler.dart';
import '../../domain/entities/MovieResponse.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {
    on<GetAllMoviesEvent>((_getAllMovies));
    on<GetMoviesByCategoryEvent>((_getMoviesByCategory));
  }

  Future<void> _getAllMovies(
    GetAllMoviesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetAllMovieLoading());
    final result = await sl<GetAllMovieUseCase>().getAllMovies();

    return result.fold((fail) {
      emit(GetAllMovieError());
    }, (data) => emit(GetAllMovieSuccsed(data)));
  }

  Future<void> _getMoviesByCategory(
    GetMoviesByCategoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetMoviesByCategoryLoading());
    final result = await sl<GetMoviesByCategoryUseCase>().getMoviesByCategory(
        event.category);

    return result.fold((fail) {
      emit(GetMoviesByCategoryError());
    }, (data) => emit(GetMoviesByCategorySuccsed(data)));
  }
}
