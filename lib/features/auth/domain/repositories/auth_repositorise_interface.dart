import 'package:dartz/dartz.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_request.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_request.dart';

abstract class AuthRepositoriseInterface {
  Future<Either<Fail, bool>> SignIn(SignInRequest data);

  Future<Either<Fail, bool>> SingUp(SignUpRequest data);
}
