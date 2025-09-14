import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/local_storge_key.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/core/failure/server_failure.dart';
import 'package:movie_app/features/auth/data/data_sources/auth_data_source.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_request.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_response.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_request.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_response.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repositorise_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../profile/domain/entities/profile_response.dart';

class AuthRepositoryImp implements AuthRepositoriseInterface {
  final AuthDataSourceInterface _authDataSourceInterface;

  AuthRepositoryImp(this._authDataSourceInterface);
  @override
  Future<Either<Failure, SignInResponse>> SignIn(SignInRequest data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await _authDataSourceInterface.SignIn(data);
    try {
      print("------------${response.toString()}");
      if (response.statusCode == 200 &&
          response.data["message"] == "Success Login") {
        var data = SignInResponse.fromJson(response.data);
        prefs.setString(LocalKeys.AuthToken, data.token);

        return Right(data);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            messageEn: response.data["message"],
          ),
        );
      }
    } on DioException catch (dioExption) {
      return Left(
        ServerFailure(
          statusCode: dioExption.response.toString(),
          messageEn: dioExption.response?.data["message"],
        ),
      );
    } catch (error) {
      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
          messageEn: error.toString(),
          messageAr: '',
          message: '',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SignUpResponse>> SingUp(SignUpRequest data) async {
    print("SignUp request: $data");
    try {
      final response = await _authDataSourceInterface.SignUp(data);

      if (response.statusCode == 201 &&
          response.data["message"] == "User created successfully") {
        print("SignUp response: ${response.data}");
        var data = SignUpResponse.fromJson(response.data);
        return Right(data);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            messageEn: response.data["message"],
          ),
        );
      }
    } on DioException catch (dioExption) {
      print("SignUp response: ${dioExption.response}");

      return Left(
        ServerFailure(
          statusCode: dioExption.response.toString(),

          messageEn: dioExption.response?.data.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProfileResponse>> getProfile(String data) async {
    try {
      final response = await _authDataSourceInterface.getProfile(data);

      if (response.statusCode == 200) {
        var user = ProfileResponse.fromJson(response.data['data']);
        print("--------------#----------${user}");
        return Right(user);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            messageEn: response.data["message"],
          ),
        );
      }
    } on DioException catch (dioExption) {
      return Left(
        ServerFailure(
          statusCode: dioExption.response.toString(),
          messageEn: dioExption.response?.data["message"],
        ),
      );
    } catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.toString(),
          messageEn: error.toString(),
          messageAr: '',
          message: '',
        ),
      );
    }
  }
}
