import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fiap/screens/home/ui/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app_fiap/screens/register/bloc/register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit(super.initialState);

  void handleChangeText(
    String? email,
    String? password,
    String? confirmPassword,
  ) {
    emit(state.copyWith(
      email: email ?? state.email,
      password: password ?? state.password,
      confirmPassword: confirmPassword ?? state.confirmPassword,
    ));
  }

  void handleSubmit(BuildContext context) {
    final firebaseAuth = FirebaseAuth.instance;

    if (state.email == '' ||
        state.password == '' ||
        state.confirmPassword == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Todos os campos são obrigatórios',
          ),
        ),
      );
      return;
    }

    if (state.password != state.confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'As senhas devem ser iguais',
          ),
        ),
      );
      return;
    }

    firebaseAuth
        .createUserWithEmailAndPassword(
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

class RegisterCubitProvider extends BlocProvider<RegisterCubit> {
  RegisterCubitProvider({Key? key, Widget? child})
      : super(
          key: key,
          create: (context) => RegisterCubit(
            const RegisterCubitState(
              email: '',
              password: '',
              confirmPassword: '',
            ),
          ),
          child: child,
        );

  static RegisterCubit of(BuildContext context) => BlocProvider.of(context);
}
