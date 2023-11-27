import 'package:flutter/material.dart';

class StatelessTextField extends StatefulWidget {
  final String value;
  final Function(String) onChanged;

  const StatelessTextField({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _StatelessTextFieldState createState() => _StatelessTextFieldState();
}

class _StatelessTextFieldState extends State<StatelessTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant StatelessTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the text state has changed.
    if (oldWidget.value != widget.value) {
      // If it has, update the controller's value without moving the cursor to the end of the text field.
      _controller.value = _controller.value.copyWith(
        text: widget.value,
        selection: TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: const TextStyle(
        fontSize: 14,
      ),
      onChanged: (text) {
        widget.onChanged(text);
      },
    );
  }
}
