import 'package:fitbuddy/core/widgets/molecules/forms/labeled_password_field.dart';
import 'package:fitbuddy/core/widgets/molecules/forms/labeled_text_field.dart';
import 'package:fitbuddy/core/widgets/molecules/forms/submit_section.dart';
import 'package:fitbuddy/core/widgets/molecules/forms/terms_and_conditions_checkbox.dart';
import 'package:flutter/material.dart';

// Organismo: Formulario de registro
class RegisterForm extends StatefulWidget {
  final void Function(String email, String password, bool acceptedTerms)
  onSubmit;
  final bool loading;

  const RegisterForm({super.key, required this.onSubmit, this.loading = false});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _acceptedTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() == true && _acceptedTerms) {
      widget.onSubmit(
        _emailController.text.trim(),
        _passwordController.text,
        _acceptedTerms,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          LabeledTextField(
            label: 'Correo electrónico',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (!value.contains('@')) return 'Correo inválido';
              return null;
            },
          ),
          const SizedBox(height: 16),
          LabeledPasswordField(
            label: 'Contraseña',
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.length < 6) return 'Mínimo 6 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 16),
          TermsAndConditionsCheckbox(
            value: _acceptedTerms,
            onChanged: (val) => setState(() => _acceptedTerms = val ?? false),
            text: 'Acepto los términos y condiciones',
          ),
          SubmitSection(
            text: 'Ingresar',
            onPressed: _handleSubmit,
            loading: widget.loading,
          ),
        ],
      ),
    );
  }
}
