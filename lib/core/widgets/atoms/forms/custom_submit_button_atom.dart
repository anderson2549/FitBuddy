import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/molecules/forms/submit_section.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool loading;

  const CustomSubmitButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SubmitSection(text: text, onPressed: onPressed, loading: loading);
  }
}
