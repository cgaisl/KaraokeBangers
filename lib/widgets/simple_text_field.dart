import 'package:flutter/material.dart';

class SimpleTextField extends StatefulWidget {
  final String value;
  final Function(String) onChanged;
  final String hint;
  final FocusNode? focusNode;

  const SimpleTextField({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.hint,
    this.focusNode,
  }) : super(key: key);

  @override
  _SimpleTextFieldState createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant SimpleTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
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
    return Stack(
      children: [
        TextField(
          focusNode: widget.focusNode,
          controller: _controller,
          onChanged: widget.onChanged,
          decoration: null,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(
            fontSize: 14,
          ),
          onTapOutside: (event) {
            // check if tap was in the top third of the screen
            if (event.position.dy < MediaQuery.of(context).size.height / 3) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
        ),
        Visibility(
          visible: widget.value.isEmpty,
          child: Text(
            widget.hint,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
