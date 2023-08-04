import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jmo/presentation/login/cubit/form_login_validation_cubit.dart';
import 'package:jmo/presentation/login/cubit/login_cubit.dart';
import 'package:jmo/presentation/main/cubit/navigator_cubit.dart';
import 'package:jmo/presentation/main/news/cubit/another_news_cubit.dart';
import 'package:jmo/presentation/main/news/cubit/new_news_cubit.dart';
import 'package:jmo/presentation/onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FormLoginValidationCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => NavigatorCubit(),
        ),
        BlocProvider(
          create: (context) => AnotherNewsCubit(),
        ),
        BlocProvider(
          create: (context) => NewNewsCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'JMO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const SafeArea(child: SplashScreen()),
      ),
    );
  }
}
