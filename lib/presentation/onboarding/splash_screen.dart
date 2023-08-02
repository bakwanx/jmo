import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jmo/presentation/login/login_screen.dart';
import 'package:jmo/presentation/onboarding/cubit/splash_cubit.dart';
import 'package:jmo/utils/constant/assets_path.dart';
import 'package:jmo/utils/theme/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    BlocProvider.of<SplashCubit>(context, listen: false).startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashFinish) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    logoApp,
                    width: 300,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    child: Text(
                      "APLIKASI RESMI LAYANAN DIGITAL BPJAMSOSTEK",
                      style: primaryTextStyle.copyWith(
                        color: greyColorText,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
