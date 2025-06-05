import 'package:flutter/material.dart';

class InputFieldAtom extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const InputFieldAtom({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: theme.colorScheme.onBackground.withOpacity(0.2),
      ),
    );

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: theme.colorScheme.onBackground.withOpacity(0.2),
        ),
        floatingLabelStyle: TextStyle(
          color: theme.colorScheme.onBackground.withOpacity(0.7),
        ),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        fillColor: theme.colorScheme.onBackground.withOpacity(0.09),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
      ),
      validator: validator,
    );
  }
}
