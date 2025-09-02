import 'package:dartz/dartz.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_request.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_request.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repositorise_interface.dart';

class AuthRepository implements AuthRepositoriseInterface {
  @override
  Future<Either<Fail, bool>> SignIn(SignInRequest data) {
    // TODO: implement SignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Fail, bool>> SingUp(SignUpRequest data) {
    // TODO: implement SingUp
    throw UnimplementedError();
  }
}
