import 'package:flutter/material.dart';
import 'package:karaoke_bangers/util/widget_list_extension.dart';
import 'package:karaoke_bangers/widgets/small_elevated_button.dart';

class AddDialog extends StatefulWidget {
  final String title;
  final Function(String) onSubmit;

  const AddDialog({
    Key? key,
    required this.title,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: [Text(widget.title), Spacer()]),
        TextField(controller: _controller),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SmallElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: "Cancel",
            ),
            const SizedBox(width: 8),
            SmallElevatedButton(
              onPressed: () {
                widget.onSubmit(_controller.text);
                Navigator.of(context).pop();
              },
              text: "Add",
            ),
          ],
        ),
      ].insertBetween(const SizedBox(height: 24)),
    );
  }
}
