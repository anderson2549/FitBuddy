import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/atoms/forms/input_field_atom.dart';
import 'package:fitbuddy/core/widgets/molecules/forms/submit_section.dart';
import 'package:go_router/go_router.dart';
import 'forgot_password_screen.dart';
import 'package:fitbuddy/core/widgets/atoms/text_translation.dart';

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
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),

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
                  labelText: TextTranslation.getString(
                    context,
                    'email_label_text', // Key for translation
                  ),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return TextTranslation.getString(
                        context,
                        'email_required_text', // Key for translation
                      );
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return TextTranslation.getString(
                        context,
                        'email_invalid_text', // Key for translation
                      );
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password field
                InputFieldAtom(
                  controller: passwordController,
                  labelText: TextTranslation.getString(
                    context,
                    'password_label_text', // Key for translation
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return TextTranslation.getString(
                        context,
                        'password_required_text', // Key for translation
                      );
                    }
                    if (value.length < 6) {
                      return TextTranslation.getString(
                        context,
                        'password_min_length_text', // Key for translation
                      );
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Submit button
                SubmitSection(
                  text: TextTranslation.getString(
                    context,
                    'login_button_text', // Key for translation
                  ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: TextTranslation(
                    'forgot_password_text', // Key for translation
                    style: TextStyle(color: Colors.blue),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    context.go('/register'); // Navigate to the register screen
                  },
                  child: TextTranslation(
                    'create_account_text', // Key for translation
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
