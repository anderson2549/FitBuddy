import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/atoms/forms/button_atom.dart';

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
      child: ButtonAtom(texto: text, onPressed: onPressed),
    );
  }
}
