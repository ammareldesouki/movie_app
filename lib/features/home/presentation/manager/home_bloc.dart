import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/home/data/data_sources/home_data_source.dart';
import 'package:movie_app/features/home/data/repositories/move_repo_imp.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';
import 'package:movie_app/features/home/domain/use_cases/get_all_movie.dart';
import 'package:movie_app/features/home/domain/use_cases/get_movie_by_category.dart';

import '../../domain/entities/MovieResponse.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late HomeRepoSitory _homeRepository;
  late HomeDataSourceInterface _homeDataSourceInterface;
  late GetAllMovieUseCase _getAllMovieUseCase;
  late GetMoviesByCategoryUseCase _getMoviesByCategoryUseCase;
  HomeBloc() : super(HomeInitial()) {
    on<GetAllMoviesEvent>((_getAllMovies));
    on<GetMoviesByCategoryEvent>((_getMoviesByCategory));
  }

  Future<void> _getAllMovies(
    GetAllMoviesEvent event,
    Emitter<HomeState> emit,
  ) async {
    _homeDataSourceInterface = RemoteHomeDataSource(dio: Dio());
    _homeRepository = HomeRepositortImpl(_homeDataSourceInterface);
    _getAllMovieUseCase = GetAllMovieUseCase(_homeRepository);
    emit(GetAllMovieLoading());
    final result = await _getAllMovieUseCase.getAllMovies();

    return result.fold((fail) {
      emit(GetAllMovieError());
    }, (data) => emit(GetAllMovieSuccsed(data)));
  }

  Future<void> _getMoviesByCategory(
    GetMoviesByCategoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    _homeDataSourceInterface = RemoteHomeDataSource(dio: Dio());
    _homeRepository = HomeRepositortImpl(_homeDataSourceInterface);
    _getMoviesByCategoryUseCase = GetMoviesByCategoryUseCase(_homeRepository);
    emit(GetMoviesByCategoryLoading());
    final result = await _getMoviesByCategoryUseCase.getMoviesByCategory(event.category);

    return result.fold((fail) {
      emit(GetMoviesByCategoryError());
    }, (data) => emit(GetMoviesByCategorySuccsed(data)));
  }
}
