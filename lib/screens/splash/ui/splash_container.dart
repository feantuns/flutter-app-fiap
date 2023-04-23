import 'package:flutter_app_fiap/screens/Splash/bloc/Splash_cubit.dart';
import 'package:flutter_app_fiap/screens/Splash/ui/Splash_screen.dart';
import 'package:flutter_app_fiap/screens/splash/bloc/splash_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashContainer extends BlocBuilder<SplashCubit, SplashCubitState> {
  SplashContainer({super.key})
      : super(builder: (context, state) {
          return const SplashScreen();
        });
}
