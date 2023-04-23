import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fiap/screens/home/bloc/home_cubit_state.dart';
import 'package:flutter_app_fiap/screens/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit(super.initialState);

  void logout(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;

    firebaseAuth.signOut().then((userCredentials) {
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    }).onError(
      (FirebaseAuthException error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.message ?? 'Ops, algo errado aconteceu',
            ),
          ),
        );
      },
    );
  }
}

class HomeCubitProvider extends BlocProvider<HomeCubit> {
  HomeCubitProvider({Key? key, Widget? child})
      : super(
          key: key,
          create: (context) => HomeCubit(
            const HomeCubitState(),
          ),
          child: child,
        );

  static HomeCubit of(BuildContext context) => BlocProvider.of(context);
}
