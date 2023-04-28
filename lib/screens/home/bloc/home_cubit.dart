import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fiap/screens/home/bloc/home_cubit_state.dart';
import 'package:flutter_app_fiap/screens/home/data/use_cases/remote_fetch_books.dart';
import 'package:flutter_app_fiap/screens/home/domain/entities/book_topics_entity.dart';
import 'package:flutter_app_fiap/screens/home/domain/use_cases/fetch_books.dart';
import 'package:flutter_app_fiap/screens/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit(
    super.initialState, {
    required this.fetchBooks,
  });

  FetchBooks fetchBooks;

  Future<void> fetch() async {
    final bookByTopics = await fetchBooks.execute();
    emit(state.copyWith(bookByTopics: bookByTopics));
  }

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
            const HomeCubitState(
              bookByTopics: BookTopicsEntity(
                romance: [],
                poetry: [],
                children: [],
              ),
            ),
            fetchBooks: RemoteFetchBooks(),
          )..fetch(),
          child: child,
        );

  static HomeCubit of(BuildContext context) => BlocProvider.of(context);
}
