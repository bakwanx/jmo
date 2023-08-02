import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startTimer() {
    Timer(const Duration(seconds: 2), () {
      emit(SplashFinish());
    });
  }
}
