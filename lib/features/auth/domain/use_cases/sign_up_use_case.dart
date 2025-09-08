import 'package:dartz/dartz.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_request.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_response.dart';

import '../../../../core/failure/failure.dart';
import '../repositories/auth_repositorise_interface.dart';

class SignUpUseCase {
  final AuthRepositoriseInterface authRepository;

  SignUpUseCase(this.authRepository);

  Future<Either<Failure, SignUpResponse>> call(SignUpRequest data) async {
    return await authRepository.SingUp(data);
  }
}
