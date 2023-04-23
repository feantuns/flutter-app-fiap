import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_fiap/screens/Splash/bloc/Splash_cubit.dart';
import 'package:flutter_app_fiap/screens/home/bloc/home_cubit.dart';
import 'package:flutter_app_fiap/screens/home/ui/home_container.dart';
import 'package:flutter_app_fiap/screens/home/ui/home_screen.dart';
import 'package:flutter_app_fiap/screens/login/bloc/login_cubit.dart';
import 'package:flutter_app_fiap/screens/login/ui/login_container.dart';
import 'package:flutter_app_fiap/screens/login/ui/login_screen.dart';
import 'package:flutter_app_fiap/screens/register/bloc/register_cubit.dart';
import 'package:flutter_app_fiap/screens/register/ui/register_container.dart';
import 'package:flutter_app_fiap/screens/register/ui/register_screen.dart';
import 'package:flutter_app_fiap/screens/splash/ui/splash_container.dart';
import 'package:flutter_app_fiap/screens/splash/ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Fiap',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) =>
            SplashCubitProvider(child: SplashContainer()),
        HomeScreen.id: (context) => HomeCubitProvider(child: HomeContainer()),
        LoginScreen.id: (context) =>
            LoginCubitProvider(child: LoginContainer()),
        RegisterScreen.id: (context) =>
            RegisterCubitProvider(child: RegisterContainer()),
      },
    );
  }
}
