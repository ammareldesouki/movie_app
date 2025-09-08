import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/failure/server_failure.dart';
import 'package:movie_app/core/network/api_constant.dart';
import 'package:movie_app/features/auth/data/data_sources/auth_data_source.dart';
import 'package:movie_app/features/auth/data/repositories_imp/auth_repository_imp.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_request.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repositorise_interface.dart';
import 'package:movie_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:movie_app/features/auth/domain/use_cases/sign_up_use_case.dart';

import '../../domain/entities/sign_up_request.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late SignInUseCase _signInUseCase;
  late AuthRepositoriseInterface _authRepositoryInterFace;
  late AuthDataSourceInterface _authInterDataSources;
  late SignUpUseCase _signUpUseCase;

  AuthBloc() : super(AuthInitial()) {
    on<SingInEvent>((_SingIn));
    on<SingUpEvent>((_SignUp));
  }

  FutureOr<void> _SingIn(SingInEvent event, Emitter<AuthState> emit) async {
    _authInterDataSources = RemoteAuthDataSource(dio: Dio());
    _authRepositoryInterFace = AuthRepositoryImp(_authInterDataSources);
    _signInUseCase = SignInUseCase(_authRepositoryInterFace);
    emit(AuthSignInLoading());
    final result = await _signInUseCase(event.data);
    return result.fold((fail) {
      var serverErorr = fail as ServerFailure;
      emit(AuthSignInError(error: serverErorr.message ?? "Failed to sign in"));
    }, (data) => emit(AuthSignInSuccess()));
  }

  FutureOr<void> _SignUp(SingUpEvent event, Emitter<AuthState> emit) async {
    _authInterDataSources = RemoteAuthDataSource(dio: Dio());
    _authRepositoryInterFace = AuthRepositoryImp(_authInterDataSources);
    _signUpUseCase = SignUpUseCase(_authRepositoryInterFace);
    emit(AuthSignUpLoading());
    final result = await _signUpUseCase(event.data);
    return result.fold((fail) {
      var serverErorr = fail as ServerFailure;
      emit(AuthSignUpError(error: serverErorr.message ?? "Failed to sign in"));
    }, (data) => emit(AuthSignUpSuccess()));
  }
}
