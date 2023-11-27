import 'package:flutter/widgets.dart';
import 'package:karaoke_bangers/widgets/small_elevated_button.dart';

class DeleteDialog extends StatelessWidget {
  final Function() onSubmit;

  DeleteDialog({Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Are you sure you want to delete this song?',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'This action cannot be undone.',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 24),
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
                onSubmit();
              },
              text: "Delete",
            ),
          ],
        ),
      ],
    );
  }
}
