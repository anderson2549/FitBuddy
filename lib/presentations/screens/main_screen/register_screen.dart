import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/templates/register_template.dart';

class RegisterScreen extends StatelessWidget {
  static const name = 'register_screen';

  const RegisterScreen({super.key});

  void _handleRegister(String email, String password, bool acceptedTerms) {
    // Aquí va la lógica de registro (API, provider, etc.)
    debugPrint('Email: $email');
    debugPrint('Password: $password');
    debugPrint('Términos aceptados: $acceptedTerms');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RegisterTemplate(onRegister: _handleRegister),
    );
  }
}
