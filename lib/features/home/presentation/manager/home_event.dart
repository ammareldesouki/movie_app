part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


class GetAllMoviesEvent extends HomeEvent {}

class GetMoviesByCategoryEvent extends HomeEvent {
  final String category;
  GetMoviesByCategoryEvent(this.category);

}