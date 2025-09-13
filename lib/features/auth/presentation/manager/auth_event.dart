part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SingInEvent extends AuthEvent {
  final SignInRequest data;

  SingInEvent(this.data);
}

class GetProfileEvent extends AuthEvent {}

class SingUpEvent extends AuthEvent {
  final SignUpRequest data;

  SingUpEvent(this.data);
}
