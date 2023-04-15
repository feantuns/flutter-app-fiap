import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = '/register_screen';

  const RegisterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Cadastre-se',
          ),
        ],
      ),
    ));
  }
}
