import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/home/domain/entities/MovieResponse.dart';
import 'package:movie_app/features/home/domain/entities/movie_details_response.dart';

abstract class HomeRepoSitory{

 Future<Either<Failure,List<MovieEntity>>>  getAllMovies();
 Future<Either<Failure,List<MovieEntity>>>  getMoviesByCategory(String category);

 Future<Either<Failure, Map<String, List<MovieEntity>>>> fitchAllMovie();

 Future<Either<Failure, MovieDetailsResponse>> getMovieDetails(int movieId);


}