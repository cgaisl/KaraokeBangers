import 'package:flutter/material.dart';
import 'package:karaoke_bangers/widgets/stateless_text_field.dart';

class TitledTextField extends StatelessWidget {
  final String title;
  final String value;
  final Function(String) onChanged;

  const TitledTextField({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // a row that contains a text and a StatelessTextField
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: StatelessTextField(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
