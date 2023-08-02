import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password){
    var emailDefault = "farhan@gmail.com";
    var passwordDefault = "123";
    if (email == emailDefault && password == passwordDefault){
      emit(SuccessLogin("Sukses login"));
    } else {
      emit(FailedLogin("Akun tidak ditemukan, pastikan email dan password anda benar"));
    }

  }
}
