import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/auth/data/repositories_imp/auth_repository_imp.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_request.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_response.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repositorise_interface.dart';

class SignInUseCase {
  final AuthRepositoriseInterface authRepository;

  SignInUseCase(this.authRepository);

  Future<Either<Failure, SignInResponse>> call(SignInRequest data) async {
    return await authRepository.SignIn(data);
  }
}
