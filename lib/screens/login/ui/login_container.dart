import 'package:flutter_app_fiap/screens/login/bloc/login_cubit.dart';
import 'package:flutter_app_fiap/screens/login/bloc/login_cubit_state.dart';
import 'package:flutter_app_fiap/screens/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginContainer extends BlocBuilder<LoginCubit, LoginCubitState> {
  LoginContainer({super.key})
      : super(builder: (context, state) {
          return LoginScreen(
            onChangeText: ({
              String? email,
              String? password,
            }) {
              LoginCubitProvider.of(context).handleChangeText(email, password);
            },
            onSubmit: () {
              LoginCubitProvider.of(context).handleSubmit(context);
            },
          );
        });
}
