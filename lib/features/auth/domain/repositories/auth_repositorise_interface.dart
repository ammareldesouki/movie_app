import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_request.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_response.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_request.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_response.dart';

import '../../../profile/domain/entities/profile_request.dart';
import '../../../profile/domain/entities/profile_response.dart';

abstract class AuthRepositoriseInterface {
  Future<Either<Failure, SignInResponse>> SignIn(SignInRequest data);

  Future<Either<Failure, SignUpResponse>> SingUp(SignUpRequest data);

  Future<Either<Failure, ProfileResponse>> getProfile(GetProfileRequest data);
}
