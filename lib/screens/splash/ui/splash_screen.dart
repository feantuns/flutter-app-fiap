import 'package:flutter/material.dart';
import 'package:flutter_app_fiap/screens/home/ui/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_fiap/screens/register/ui/register_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = '/splash_screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const RegisterScreen();
        }

        return const HomeScreen();
      },
    );
  }
}
