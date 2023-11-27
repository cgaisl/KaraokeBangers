import 'package:flutter/material.dart';

class CategoryLabel extends StatelessWidget {
  final String text;

  const CategoryLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      // Padding
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text.length < 10 ? text : text.substring(0, 10) + "...",
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
