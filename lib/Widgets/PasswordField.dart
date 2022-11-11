import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final bool obscureText;
  final VoidCallback onTap;
  final String label;
  final String hint;
  final TextEditingController controller;

  PasswordField(
      {required this.obscureText,
      required this.onTap,
      required this.label,
      required this.hint,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 12, right: 15, bottom: 10),
            child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        labelText: label,
        hintText: hint,
        border: const UnderlineInputBorder(),
      ),
      controller: controller,
    );
  }
}
