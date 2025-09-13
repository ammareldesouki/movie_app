part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetAllMovieLoading extends HomeState {}

class GetAllMovieSuccsed extends HomeState {
  final List<MovieEntity> movies;

  GetAllMovieSuccsed(this.movies);
}

class GetAllMovieError extends HomeState {}



class GetMoviesByCategoryLoading extends HomeState {}

class GetMoviesByCategorySuccsed extends HomeState {
  final List<MovieEntity> movies;

  GetMoviesByCategorySuccsed(this.movies);
}

class GetMoviesByCategoryError extends HomeState {}

class FetchAllMovieLoading extends HomeState {}

class FetchAllMovieSuccsed extends HomeState {
  final Map<String, List<MovieEntity>> movies;

  FetchAllMovieSuccsed(this.movies);
}

class FetchAllMovieError extends HomeState {}

class GetMovieDetailsLoading extends HomeState {}

class GetMovieDetailsSuccsed extends HomeState {
  final MovieDetailsResponse movieDetails;

  GetMovieDetailsSuccsed(this.movieDetails);
}

class GetMovieDetailsError extends HomeState {}
