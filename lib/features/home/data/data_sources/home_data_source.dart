

import 'package:dio/dio.dart';
import 'package:movie_app/core/network/end_points.dart';

abstract class HomeDataSourceInterface {

  Future<Response> getAllMovies();
  Future<Response> getMoviesByCategory(String category);

}
class RemoteHomeDataSource implements HomeDataSourceInterface {
  final Dio dio;
  RemoteHomeDataSource({required this.dio});

  @override
  Future<Response> getAllMovies() {
    return dio.get(EndPoints.getAllMovies);
  }
  Future<Response> getMoviesByCategory(String category){
    return dio.get(EndPoints.getAllMovies,queryParameters: {'page': 1, 'limit': 4,"genre": "$category"});

  }
}