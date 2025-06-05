import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/atoms/forms/custom_checkbox_atom.dart';

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
