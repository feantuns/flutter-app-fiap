import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fiap/screens/home/ui/home_screen.dart';
import 'package:flutter_app_fiap/screens/login/bloc/login_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit(super.initialState);

  void handleChangeText(
    String? email,
    String? password,
  ) {
    emit(state.copyWith(
      email: email ?? state.email,
      password: password ?? state.password,
    ));
  }

  void handleSubmit(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;

    if (state.email == '' || state.password == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Todos os campos são obrigatórios',
          ),
        ),
      );
      return;
    }

    firebaseAuth
        .signInWithEmailAndPassword(
      email: state.email as String,
      password: state.password as String,
    )
        .then((userCredentials) {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
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

class LoginCubitProvider extends BlocProvider<LoginCubit> {
  LoginCubitProvider({Key? key, Widget? child})
      : super(
          key: key,
          create: (context) => LoginCubit(
            const LoginCubitState(
              email: '',
              password: '',
            ),
          ),
          child: child,
        );

  static LoginCubit of(BuildContext context) => BlocProvider.of(context);
}
