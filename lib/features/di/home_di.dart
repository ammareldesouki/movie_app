import 'package:movie_app/core/network/api_constant.dart';
import 'package:movie_app/core/network/network_dio_handler.dart';
import 'package:movie_app/features/home/data/data_sources/home_data_source.dart';
import 'package:movie_app/features/home/data/repositories/move_repo_imp.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';
import 'package:movie_app/features/home/domain/use_cases/get_all_movie.dart';
import 'package:movie_app/features/home/domain/use_cases/get_movie_by_category.dart';

import '../../core/di_handler/app_di_handler.dart';

class HomeDi {
  static Future<void> setUp() async {
    sl
      ..registerLazySingleton(() => NetworkDioHandler(ApiConstat.MovieBaseUrl))
      ..registerLazySingleton<HomeDataSourceInterface>(
        () => RemoteHomeDataSource(sl.get<NetworkDioHandler>()),
      )
      ..registerLazySingleton<HomeRepoSitory>(
        () => HomeRepositortImpl(sl.get<HomeDataSourceInterface>()),
      )
      ..registerLazySingleton(
        () => GetAllMovieUseCase(sl.get<HomeRepoSitory>()),
      )
      ..registerLazySingleton(
        () => GetMoviesByCategoryUseCase(sl.get<HomeRepoSitory>()),
      );
  }
}
