import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;

  const CustomTextField(
      {required this.label,
      required this.hint,
      required this.controller,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const UnderlineInputBorder(),
      ),
      controller: controller,
    );
  }
}
