

import 'package:dio/dio.dart';
import 'package:movie_app/core/network/end_points.dart';
import 'package:movie_app/core/network/network_dio_handler.dart';

abstract class HomeDataSourceInterface {

  Future<Response> getAllMovies();
  Future<Response> getMoviesByCategory(String category);

}
class RemoteHomeDataSource implements HomeDataSourceInterface {
  final NetworkDioHandler _dioHandler;

  RemoteHomeDataSource(this._dioHandler);

  @override
  Future<Response> getAllMovies() {
    return _dioHandler.dio.get(EndPoints.getAllMovies);
  }
  Future<Response> getMoviesByCategory(String category){
    return _dioHandler.dio.get(EndPoints.getAllMovies,
        queryParameters: {'page': 1, 'limit': 4, "genre": "$category"});

  }
}