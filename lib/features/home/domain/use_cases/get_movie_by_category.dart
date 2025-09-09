import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/MovieResponse.dart';
import '../repositories/home_repository.dart';

class GetMoviesByCategoryUseCase {
  final HomeRepoSitory _homerepository;

  GetMoviesByCategoryUseCase(this._homerepository);

  Future<Either<Failure, List<MovieEntity>>> getMoviesByCategory(
    String category,
  ) async {
    return await _homerepository.getMoviesByCategory(category);
  }
}
