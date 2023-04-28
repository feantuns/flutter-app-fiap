import 'package:flutter/material.dart';

class FilledTextField extends StatelessWidget {
  const FilledTextField({
    super.key,
    required this.label,
    required this.onTextChange,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  });

  final String label;
  final TextInputType textInputType;
  final bool obscureText;
  final Function(String) onTextChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      obscureText: obscureText,
      onChanged: onTextChange,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
      ),
    );
  }
}
