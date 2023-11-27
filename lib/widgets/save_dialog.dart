import 'package:flutter/widgets.dart';
import 'package:karaoke_bangers/widgets/small_elevated_button.dart';

class SaveDialog extends StatelessWidget {
  final Function() onSave;

  const SaveDialog({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Do you want to save your changes?',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SmallElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              text: "Discard",
            ),
            const SizedBox(width: 8),
            SmallElevatedButton(
              onPressed: () {
                onSave();
                Navigator.of(context).pop(true);
              },
              text: "Save",
            ),
          ],
        ),
      ],
    );
  }
}
