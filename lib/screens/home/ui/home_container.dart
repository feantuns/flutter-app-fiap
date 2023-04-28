import 'package:flutter_app_fiap/screens/home/bloc/home_cubit.dart';
import 'package:flutter_app_fiap/screens/home/bloc/home_cubit_state.dart';
import 'package:flutter_app_fiap/screens/home/ui/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContainer extends BlocBuilder<HomeCubit, HomeCubitState> {
  HomeContainer({super.key})
      : super(builder: (context, state) {
          return HomeScreen(
            onLogout: () {
              HomeCubitProvider.of(context).logout(context);
            },
            bookTopics: state.bookByTopics,
          );
        });
}
