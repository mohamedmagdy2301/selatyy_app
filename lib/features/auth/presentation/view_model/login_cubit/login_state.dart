part of 'login_cubit.dart';

class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess(this.token);
}

final class LoginFailure extends LoginState {
  final String errorMesssage;

  LoginFailure(this.errorMesssage);
}
