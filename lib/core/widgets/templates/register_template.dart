import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/atoms/forms/Button.dart';
import 'package:fitbuddy/core/widgets/atoms/forms/InputField.dart';

class RegisterTemplate extends StatefulWidget {
  final void Function(String email, String password, bool acceptedTerms)
  onRegister;
  const RegisterTemplate({Key? key, required this.onRegister})
    : super(key: key);

  @override
  State<RegisterTemplate> createState() => _RegisterTemplateState();
}

class _RegisterTemplateState extends State<RegisterTemplate> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _docNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 48.0, 24.0, 24.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_add_alt_1_rounded,
                size: 64,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 24),
              InputFieldAtom(
                controller: _firstNameController,
                labelText: 'Nombres',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tus nombres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              InputFieldAtom(
                controller: _lastNameController,
                labelText: 'Apellidos',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tus apellidos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              InputFieldAtom(
                controller: _emailController,
                labelText: 'Correo',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu correo';
                  }
                  if (!value.contains('@')) {
                    return 'Por favor, ingresa un correo válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              InputFieldAtom(
                controller: _docNumberController,
                labelText: 'Número de documento',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu número de documento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              InputFieldAtom(
                controller: _passwordController,
                labelText: 'Contraseña',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu contraseña';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              InputFieldAtom(
                controller: _confirmPasswordController,
                labelText: 'Confirmar contraseña',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirma tu contraseña';
                  }
                  if (value != _passwordController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _acceptedTerms,
                    onChanged:
                        (val) => setState(() => _acceptedTerms = val ?? false),
                    activeColor: theme.colorScheme.primary,
                  ),
                  Expanded(
                    child: Text(
                      'Acepto los términos y condiciones',
                      style: TextStyle(color: theme.colorScheme.onBackground),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Boton(
                texto: 'Registrarse',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onRegister(
                      _emailController.text,
                      _passwordController.text,
                      _acceptedTerms,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
