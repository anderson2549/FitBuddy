import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/atoms/forms/input_field_atom.dart';
import 'package:fitbuddy/core/widgets/molecules/forms/submit_section.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login_screen';

  const LoginScreen({super.key});

  void _handleLogin(BuildContext context, String email, String password) {
    // Aquí va la lógica de inicio de sesión (API, provider, etc.)
    debugPrint('Email: $email');
    debugPrint('Password: $password');
    context.go('/main'); // Navigate to the MainScreen
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Icon at the top
              Icon(
                Icons.fitness_center,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 32),

              // Email field
              InputFieldAtom(
                controller: emailController,
                labelText: 'Correo',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo es obligatorio.';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Ingrese un correo válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password field
              InputFieldAtom(
                controller: passwordController,
                labelText: 'Contraseña',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La contraseña es obligatoria.';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Submit button
              SubmitSection(
                text: 'Iniciar sesión',
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    _handleLogin(
                      context,
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),

              // Recuperar contraseña and Crear cuenta options
              TextButton(
                onPressed: () {
                  // Logic for password recovery
                  debugPrint('Recuperar contraseña');
                },
                child: const Text('Recuperar contraseña'),
              ),
              TextButton(
                onPressed: () {
                  context.go('/register'); // Navigate to the register screen
                },
                child: const Text('Crear cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
