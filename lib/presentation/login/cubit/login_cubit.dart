import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
    var emailDefault = "farhan@gmail.com";
    var passwordDefault = "123";
    emit(OnLoadingLogin());
    await Future.delayed(Duration(seconds: 3));
    if (email == emailDefault && password == passwordDefault){
      emit(SuccessLogin("Sukses login"));
    } else {
      emit(FailedLogin("Akun tidak ditemukan, pastikan email dan password anda benar"));
    }

  }
}
