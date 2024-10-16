import 'package:flutter/material.dart';

class LableMenuItem extends StatelessWidget {
  const LableMenuItem({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        const SizedBox(width: 12),
        Text(text),
      ],
    );
  }
}
