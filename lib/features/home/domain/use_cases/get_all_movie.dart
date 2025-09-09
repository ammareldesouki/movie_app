

import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/MovieResponse.dart';
import '../repositories/home_repository.dart';

class GetAllMovieUseCase{
  final HomeRepoSitory _homerepository;

  GetAllMovieUseCase(this._homerepository);

  Future<Either<Failure,List<MovieEntity>>>getAllMovies() async {

    return await _homerepository.getAllMovies();
  }

}