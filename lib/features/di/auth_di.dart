import 'package:movie_app/core/network/api_constant.dart';
import 'package:movie_app/core/network/network_dio_handler.dart';
import 'package:movie_app/features/auth/data/data_sources/auth_data_source.dart';
import 'package:movie_app/features/auth/data/repositories_imp/auth_repository_imp.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repositorise_interface.dart';
import 'package:movie_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:movie_app/features/auth/presentation/manager/auth_bloc.dart';

import '../../core/di_handler/app_di_handler.dart';
import '../auth/domain/use_cases/sign_up_use_case.dart';

abstract class AuthDi {
  // Dio
  // Data Source
  // Repository
  // Use Cases
  // Bloc
  static Future<void> setUp() async {
    sl..registerLazySingleton(() => NetworkDioHandler(ApiConstat.AuthbaseUrl))
      ..registerLazySingleton<AuthDataSourceInterface>(
        () => RemoteAuthDataSource(sl.get<NetworkDioHandler>()),
      )
      ..registerLazySingleton<AuthRepositoriseInterface>(
        () => AuthRepositoryImp(sl.get<AuthDataSourceInterface>()),
      )
      ..registerLazySingleton(
        () => SignInUseCase(sl.get<AuthRepositoriseInterface>()),
      )
      ..registerLazySingleton(
        () => SignUpUseCase(sl.get<AuthRepositoriseInterface>()),
      )
      ..registerLazySingleton<AuthBloc>(() => AuthBloc());
    // ..registerLazySingleton(()=>ForgetPasswordUseCase(sl.get<AuthRepositoriseInterface>()));
  }
}
