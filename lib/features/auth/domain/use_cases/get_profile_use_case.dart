import 'package:dartz/dartz.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repositorise_interface.dart';

import '../../../../core/failure/failure.dart';
import '../../../profile/domain/entities/profile_response.dart';

class GetProfileUseCase {
  final AuthRepositoriseInterface _authRepositoriseInterface;

  GetProfileUseCase(this._authRepositoriseInterface);

  Future<Either<Failure, ProfileResponse>> call(String data) async {
    return await _authRepositoriseInterface.getProfile(data);
  }
}
