import 'package:fitbuddy/core/widgets/atoms/forms/custom_checkbox_atom.dart';
import 'package:fitbuddy/core/widgets/atoms/forms/custom_submit_button_atom.dart';
import 'package:flutter/material.dart';

// Un campo de texto con label y validación, y un mensaje de error debajo
class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;

  const LabeledTextField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 4),
        LabeledTextField(
          label: label,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}

// Un campo de contraseña con label y validación
class LabeledPasswordField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const LabeledPasswordField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledTextField(
      label: label,
      controller: controller,
      validator: validator,
      obscureText: true,
    );
  }
}

// Un checkbox con texto y un callback
class TermsAndConditionsCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String text;

  const TermsAndConditionsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCheckbox(value: value, onChanged: onChanged, label: text);
  }
}

// Un botón de submit con margen superior
class SubmitSection extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool loading;

  const SubmitSection({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: CustomSubmitButton(
        text: text,
        onPressed: onPressed,
        loading: loading,
      ),
    );
  }
}
