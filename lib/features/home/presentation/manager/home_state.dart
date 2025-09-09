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
