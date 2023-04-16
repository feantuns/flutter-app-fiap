import 'package:flutter/material.dart';
import 'package:flutter_app_fiap/screens/register/ui/register_screen.dart';
import 'package:flutter_app_fiap/widgets/styled_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login_screen';

  LoginScreen({
    super.key,
  });

  var inputtedEmail = '';
  var inputtedPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Entre',
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Text('Ainda não tem uma conta?',
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                            TextButton(
                                onPressed: () => Navigator.pushReplacementNamed(
                                    context, RegisterScreen.id),
                                child: const Text('Criar conta'))
                          ],
                        )),
                    const SizedBox(height: 40),
                    FilledTextField(
                      label: 'Email',
                      textInputType: TextInputType.emailAddress,
                      onTextChange: (text) => inputtedEmail = text,
                    ),
                    const SizedBox(height: 16),
                    FilledTextField(
                      label: 'Senha',
                      obscureText: true,
                      onTextChange: (text) => inputtedPassword = text,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () => print("oi"),
                      child: Text('Entrar'),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size.fromHeight(50)),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
