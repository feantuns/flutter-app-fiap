import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fiap/screens/home/ui/home_screen.dart';
import 'package:flutter_app_fiap/screens/login/ui/login_screen.dart';
import 'package:flutter_app_fiap/screens/splash/bloc/splash_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashCubitState> {
  SplashCubit(super.initialState);

  void init(BuildContext context) {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      final auth = FirebaseAuth.instance;
      if (auth.currentUser == null) {
        Navigator.pushReplacementNamed(context, LoginScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      }
    });
  }
}

class SplashCubitProvider extends BlocProvider<SplashCubit> {
  SplashCubitProvider({Key? key, Widget? child})
      : super(
          key: key,
          create: (context) => SplashCubit(
            const SplashCubitState(),
          )..init(context),
          child: child,
        );

  static SplashCubit of(BuildContext context) => BlocProvider.of(context);
}
