part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class OnLoadingLogin extends LoginState {}

class SuccessLogin extends LoginState {
  String message;
  SuccessLogin(this.message);
}

class FailedLogin extends LoginState {
  String message;
  FailedLogin(this.message);
}
