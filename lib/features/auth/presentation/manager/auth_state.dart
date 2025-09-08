part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSignInLoading extends AuthState {}

final class AuthSignInSuccess extends AuthState {}

final class AuthSignInError extends AuthState {
  final String error;

  AuthSignInError({required this.error});
}

final class AuthSignUpLoading extends AuthState {}

final class AuthSignUpSuccess extends AuthState {}

final class AuthSignUpError extends AuthState {
  final String error;

  AuthSignUpError({required this.error});
}
