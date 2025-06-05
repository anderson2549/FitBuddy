import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/molecules/forms/labeled_text_field.dart';

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
