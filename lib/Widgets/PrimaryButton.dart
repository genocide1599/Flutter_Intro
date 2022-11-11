import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPress;
  final double height;
  final double width;
  final Color color;

  const PrimaryButton(
      {required this.text,
      required this.icon,
      required this.onPress,
      required this.height,
      required this.width,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
