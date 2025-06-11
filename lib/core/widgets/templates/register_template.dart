import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/organisms/register_form.dart'; // Importa el formulario
import 'package:go_router/go_router.dart';

class RegisterTemplate extends StatelessWidget {
  final void Function(String email, String password, bool acceptedTerms)
  onRegister;
  const RegisterTemplate({Key? key, required this.onRegister})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 48.0, 24.0, 24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_add_alt_1_rounded,
              size: 64,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            RegisterForm(onRegister: onRegister), // Usa el formulario aquí
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                context.go('/login'); // Navigate to the login screen
              },
              child: const Text('¿Ya tienes una cuenta? Inicia sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
