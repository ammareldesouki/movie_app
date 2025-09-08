import 'package:dio/dio.dart';
import 'package:movie_app/core/network/end_points.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_request.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_request.dart';

abstract class AuthDataSourceInterface {
  Future<Response> SignIn(SignInRequest request);

  Future<Response> SignUp(SignUpRequest request);
}

class RemoteAuthDataSource implements AuthDataSourceInterface {
  final Dio dio;
  RemoteAuthDataSource({required this.dio});

  @override
  Future<Response> SignIn(SignInRequest request) async {
    print("------------{} $request");
    print("------------{} ${request.toJson()}");
    return dio.post(EndPoints.SignIn, data: request.toJson());
  }

  @override
  Future<Response> SignUp(SignUpRequest request) async {
    print("------------{} $request");

    return dio.post(EndPoints.SignUp, data: request.toJson());
  }
}
