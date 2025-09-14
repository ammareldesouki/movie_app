part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


class GetAllMoviesEvent extends HomeEvent {}

class GetMoviesByCategoryEvent extends HomeEvent {
  final String category;
  GetMoviesByCategoryEvent(this.category);

}

class FetchAllMovieEvent extends HomeEvent {}

class GetMovieDetailsEvent extends HomeEvent {
  final int movieId;

  GetMovieDetailsEvent(this.movieId);
}
