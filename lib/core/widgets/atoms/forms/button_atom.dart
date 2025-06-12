import 'package:fitbuddy/core/widgets/atoms/text_translation.dart';
import 'package:flutter/material.dart';

class ButtonAtom extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const ButtonAtom({Key? key, required this.texto, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      child: TextTranslation(texto),
    );
  }
}
