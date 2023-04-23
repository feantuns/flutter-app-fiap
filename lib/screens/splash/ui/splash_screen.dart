import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String id = '/splash_screen';

  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
