import 'package:dio/dio.dart';
import 'package:movie_app/core/network/end_points.dart';
import 'package:movie_app/core/network/network_dio_handler.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_request.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_request.dart';

abstract class AuthDataSourceInterface {
  Future<Response> SignIn(SignInRequest request);

  Future<Response> SignUp(SignUpRequest request);

  Future<Response> getProfile(String data);
}

class RemoteAuthDataSource implements AuthDataSourceInterface {
  final NetworkDioHandler _dioHandler;

  RemoteAuthDataSource(this._dioHandler);

  @override
  Future<Response> SignIn(SignInRequest request) async {
    print("------------{} $request");
    print("------------{} ${request.toJson()}");
    return _dioHandler.dio.post(EndPoints.SignIn, data: request.toJson());
  }

  @override
  Future<Response> SignUp(SignUpRequest request) async {
    print("------------{} $request");

    return _dioHandler.dio.post(EndPoints.SignUp, data: request.toJson());
  }


  Future<Response> getProfile(String data) {
    return _dioHandler.dio.get(EndPoints.Getprofile, options: Options(
        headers: {"Authorization": "Bearer $data"}));
  }
}
