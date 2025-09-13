import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/home/domain/entities/movie_details_response.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';

class GetMovieDetailesUseCase {
  final HomeRepoSitory _homeRepoSitory;

  GetMovieDetailesUseCase(this._homeRepoSitory);

  Future<Either<Failure, MovieDetailsResponse>> call(int movieId) async {
    return await _homeRepoSitory.getMovieDetails(movieId);
  }
}
