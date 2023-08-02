import 'package:bloc/bloc.dart';
import 'package:jmo/utils/constant/regex.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'form_login_validation_state.dart';

class FormLoginValidationCubit extends Cubit<FormLoginValidationState> {
  FormLoginValidationCubit() : super(FormLoginValidationInitial());

  final _emailController = BehaviorSubject<String>();
  Stream<String> get emailStream => _emailController.stream;
  final _passwordController = BehaviorSubject<String>();
  Stream<String> get passwordStream => _passwordController.stream;
  final _obscureTextStream = BehaviorSubject<bool>();
  Stream<bool> get obscureTextStream => _obscureTextStream.stream;

  updateObscureStatus(){
    if(_obscureTextStream.hasValue == true){
      if(_obscureTextStream.value == false){
        _obscureTextStream.sink.add(true);
      } else {
        _obscureTextStream.sink.add(false);
      }
    } else {
      _obscureTextStream.sink.add(false);
    }
  }

  updateEmail(String email){
    if(emailValidRegex.hasMatch(email) == false){
      _emailController.sink.addError("");
    } else {
      _emailController.sink.add(email);
    }
  }

  updatePassword(String password){
    if(password.isEmpty){
      _passwordController.sink.addError("Data harus diisi");
    }else {
      _passwordController.sink.add(password);
    }
  }
}
