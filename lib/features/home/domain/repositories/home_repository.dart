import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/home/domain/entities/MovieResponse.dart';

abstract class HomeRepoSitory{

 Future<Either<Failure,List<MovieEntity>>>  getAllMovies();
 Future<Either<Failure,List<MovieEntity>>>  getMoviesByCategory(String category);


}