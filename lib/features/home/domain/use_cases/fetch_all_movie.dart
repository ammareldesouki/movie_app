import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/home/domain/entities/MovieResponse.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';

class FetchAllMovieUseCase {
  final HomeRepoSitory _homeRepoSitory;

  FetchAllMovieUseCase(this._homeRepoSitory);

  Future<Either<Failure, Map<String, List<MovieEntity>>>> call() async {
    return await _homeRepoSitory.fitchAllMovie();
  }
}
