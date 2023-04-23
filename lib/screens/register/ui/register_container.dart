import 'package:flutter_app_fiap/screens/register/bloc/register_cubit.dart';
import 'package:flutter_app_fiap/screens/register/bloc/register_cubit_state.dart';
import 'package:flutter_app_fiap/screens/register/ui/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterContainer extends BlocBuilder<RegisterCubit, RegisterCubitState> {
  RegisterContainer({super.key})
      : super(builder: (context, state) {
          return RegisterScreen(
            onChangeText: ({
              String? email,
              String? password,
              String? confirmPassword,
            }) {
              RegisterCubitProvider.of(context)
                  .handleChangeText(email, password, confirmPassword);
            },
            onSubmit: () {
              RegisterCubitProvider.of(context).handleSubmit(context);
            },
          );
        });
}
