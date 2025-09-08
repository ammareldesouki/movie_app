part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SingInEvent extends AuthEvent {
  final SignInRequest data;

  SingInEvent(this.data);
}

class SingUpEvent extends AuthEvent {
  final SignUpRequest data;

  SingUpEvent(this.data);
}
