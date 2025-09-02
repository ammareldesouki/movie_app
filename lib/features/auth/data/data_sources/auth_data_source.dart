import 'package:dio/dio.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_request.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_request.dart';

abstract class AuthDataSourceInterface {
  Future<Response> SingIn(SignInRequest request);

  Future<Response> SingUp(SignUpRequest request);
}

class RemoteAuthDataSource implements AuthDataSourceInterface {
  final Dio dio;

  RemoteAuthDataSource({required this.dio});

  @override
  Future<Response> SingIn(SignInRequest request) async {
    return await dio.post('/api/v1/auth/signin', data: request.toJson());
  }

  @override
  Future<Response> SingUp(SignUpRequest request) async {
    // TODO: implement SingUp
    throw UnimplementedError();
  }
}
