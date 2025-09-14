import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/failure/server_failure.dart';
import 'package:movie_app/features/auth/domain/entities/sign_in_request.dart';
import 'package:movie_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:movie_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/local_storge_key.dart';
import '../../../../core/di_handler/app_di_handler.dart';
import '../../../profile/domain/entities/profile_response.dart';
import '../../domain/entities/sign_up_request.dart';
import '../../domain/use_cases/get_profile_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SingInEvent>((_SingIn));
    on<SingUpEvent>((_SignUp));
    on<GetProfileEvent>(_getProfile);
  }

  FutureOr<void> _SingIn(SingInEvent event, Emitter<AuthState> emit) async {
    emit(AuthSignInLoading());
    final result = await sl<SignInUseCase>().call(event.data);
    return result.fold((fail) {
      var serverErorr = fail as ServerFailure;
      emit(AuthSignInError(error: serverErorr.message ?? "Failed to sign in"));
    }, (data) => emit(AuthSignInSuccess()));
  }

  FutureOr<void> _SignUp(SingUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthSignUpLoading());
    final result = await sl<SignUpUseCase>().call(event.data);
    return result.fold((fail) {
      var serverErorr = fail as ServerFailure;
      emit(AuthSignUpError(error: serverErorr.message ?? "Failed to sign in"));
    }, (data) => emit(AuthSignUpSuccess()));
  }


  FutureOr<void> _getProfile(GetProfileEvent event,
      Emitter<AuthState> emit) async {
    emit(ProfileLoading());

    // Get token from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(LocalKeys.AuthToken);


    final result = await sl<GetProfileUseCase>().call(token!);

    result.fold((fail) {
      emit(ProfileError());
    }, (profile) {
      emit(ProfileSuccsed(profile));
    });
  }
}

