import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jmo/presentation/login/login_screen.dart';
import 'package:jmo/presentation/main/news/cubit/another_news_cubit.dart';
import 'package:jmo/presentation/main/news/cubit/new_news_cubit.dart';
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

  Future<void> startTimer() async {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });

  }

  @override
  Widget build(BuildContext context) {
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
  }
}
