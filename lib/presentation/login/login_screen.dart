import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jmo/presentation/login/cubit/form_login_validation_cubit.dart';
import 'package:jmo/presentation/login/cubit/login_cubit.dart';
import 'package:jmo/presentation/main/main_screen.dart';
import 'package:jmo/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:jmo/utils/theme/style.dart';

import '../../utils/constant/assets_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void init(){
    BlocProvider.of<FormLoginValidationCubit>(context).updateObscureStatus(isFirst: true);
  }

  void loginHandler() {
    BlocProvider.of<LoginCubit>(context)
        .login(emailController.text, passwordController.text);
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: maxHeight(context) * 0.07),
        child: Center(
          child: Image.asset(
            logoApp,
            width: 200,
          ),
        ),
      );
    }

    Widget body() {
      Widget welcomeText() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: primaryTextStyle.copyWith(
                fontWeight: extraBold,
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Silahkan login untuk masuk aplikasi",
              style:
                  primaryTextStyle.copyWith(color: greyColorText, fontSize: 13),
            )
          ],
        );
      }

      Widget email() {
        return Container(
          margin: const EdgeInsets.only(
            top: 18,
          ),
          child: StreamBuilder<Object>(
              stream: BlocProvider.of<FormLoginValidationCubit>(context)
                  .emailStream,
              builder: (context1, snapshot1) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (email) {
                        BlocProvider.of<FormLoginValidationCubit>(context1)
                            .updateEmail(email);
                      },
                      decoration: InputDecoration(
                        labelText: "Email Anda",
                        labelStyle: primaryTextStyle.copyWith(
                          color:
                              snapshot1.hasError ? Colors.red : greyColorText,
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        suffixIcon: snapshot1.hasError
                            ? IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.warning_amber,
                                  color: Colors.red,
                                ),
                              )
                            : const SizedBox(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                );
              }),
        );
      }

      Widget password() {
        return Container(
          margin: const EdgeInsets.only(
            top: 18,
          ),
          child: StreamBuilder(
            stream: BlocProvider.of<FormLoginValidationCubit>(context)
                .passwordStream,
            builder: (context1, snapshot1) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder(
                    stream: BlocProvider.of<FormLoginValidationCubit>(context)
                        .obscureTextStream,
                    builder: (context2, snapshot2) {
                      return TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: snapshot2.data == true ? true : false,
                        enableSuggestions: false,
                        autocorrect: false,
                        onChanged: (password) {
                          BlocProvider.of<FormLoginValidationCubit>(context1)
                              .updatePassword(password);
                        },
                        decoration: InputDecoration(
                          labelText: "Kata Sandi",
                          labelStyle: primaryTextStyle.copyWith(
                            color:
                                snapshot1.hasError ? Colors.red : greyColorText,
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          suffixIcon: snapshot1.hasError
                              ? IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.warning_amber,
                                    color: Colors.red,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    BlocProvider.of<FormLoginValidationCubit>(
                                            context)
                                        .updateObscureStatus();
                                  },
                                  icon: Icon(
                                    snapshot2.data == true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.green,
                                  ),
                                ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultRadius),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  snapshot1.hasError
                      ? Text(
                          snapshot1.error.toString(),
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        )
                      : const SizedBox(),
                ],
              );
            },
          ),
        );
      }

      Widget forgotPassword() {
        return Container(
          margin: EdgeInsets.only(
            top: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Lupa Akun?",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: light,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Lupa Kata Sandi?",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: light,
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget loginButton() {
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if(state is OnLoadingLogin){
              return CustomCircularProgressIndicator(
                margin: EdgeInsets.only(
                  top: defaultMargin,
                ),
              );
            }
            return StreamBuilder(
              stream: BlocProvider.of<FormLoginValidationCubit>(context)
                  .emailStream,
              builder: (context1, snapshot1) {
                return StreamBuilder<Object>(
                  stream: BlocProvider.of<FormLoginValidationCubit>(context)
                      .passwordStream,
                  builder: (context2, snapshot2) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: defaultMargin,
                      ),
                      width: maxWidth(context),
                      child: TextButton(
                        onPressed: snapshot1.hasError ||
                                snapshot2.hasError ||
                                snapshot1.data == null ||
                                snapshot2.data == null
                            ? () {}
                            : loginHandler,
                        style: TextButton.styleFrom(
                          backgroundColor: snapshot1.hasError ||
                                  snapshot2.hasError ||
                                  snapshot1.data == null ||
                                  snapshot2.data == null
                              ? Colors.grey.shade400
                              : primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              4,
                            ),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 9,
                          ),
                          child: Text(
                            "Login",
                            style: primaryTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      }

      Widget registerButton() {
        return Container(
          margin: const EdgeInsets.only(
            top: 14,
          ),
          width: maxWidth(context),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Buat Akun",
              style: primaryTextStyle.copyWith(
                color: primaryColor,
                fontSize: 16,
              ),
            ),
          ),
        );
      }

      return Container(
        margin: EdgeInsets.only(top: maxHeight(context) * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            welcomeText(),
            email(),
            password(),
            forgotPassword(),
            loginButton(),
            registerButton(),
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(top: maxHeight(context) * 0.14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "4.7.0",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: greyColorText,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessLogin) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          } else if (state is FailedLogin) {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  insetPadding: EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Image.asset(
                              icNoDocument,
                              width: 80,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 16,
                            ),
                            child: Text(
                              state.message,
                              style: primaryTextStyle.copyWith(
                                fontWeight: light,
                                fontSize: 16,
                                color: greyColorText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: maxWidth(context),
                            margin: const EdgeInsets.only(
                              top: 28,
                              bottom: 10,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Text(
                                  "OK",
                                  style: primaryTextStyle.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: defaultMargin,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(),
                  body(),
                  footer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
