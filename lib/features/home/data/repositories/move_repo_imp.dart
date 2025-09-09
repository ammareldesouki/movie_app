// This class implements the MovieRepository contract from the domain layer.
// It contains the actual logic for fetching data using Dio.

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/home/data/data_sources/home_data_source.dart';
import 'package:movie_app/features/home/domain/entities/MovieResponse.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';

import '../models/movie_model.dart';

class HomeRepositortImpl implements HomeRepoSitory {
  final HomeDataSourceInterface _homeDataSourceInterface;

  HomeRepositortImpl(this._homeDataSourceInterface);

  @override
  Future<Either<Failure, List<MovieEntity>>> getAllMovies() async {
    try {
      final response = await _homeDataSourceInterface.getAllMovies();
      if (response.statusCode == 200) {
        final List<dynamic> moviesJson = response.data['data']['movies'];
        return Right(
          moviesJson.map((json) {
            final model = MovieModel.fromJson(json);
            return model.toEntity();
          }).toList(),
        );
      } else {
        throw Exception(
          'Failed to load movies with status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception('Failed to load movies: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getMoviesByCategory(
    String category,
  ) async {
    try {
      final response = await _homeDataSourceInterface.getMoviesByCategory(
        category,
      );
      if (response.statusCode == 200) {
        final List<dynamic> moviesJson = response.data['data']['movies'];
        return Right(
          moviesJson.map((json) {
            final model = MovieModel.fromJson(json);
            return model.toEntity();
          }).toList(),
        );
      } else {
        throw Exception(
          'Failed to load movies with status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception('Failed to load movies: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
