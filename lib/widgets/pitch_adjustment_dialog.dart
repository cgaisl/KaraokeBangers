import 'package:flutter/material.dart';

class PitchAdjustmentDialog extends StatefulWidget {
  final int pitch;
  final Function(int) onPitchChanged;

  const PitchAdjustmentDialog({
    Key? key,
    required this.pitch,
    required this.onPitchChanged,
  }) : super(key: key);

  @override
  State<PitchAdjustmentDialog> createState() => _PitchAdjustmentDialogState();
}

class _PitchAdjustmentDialogState extends State<PitchAdjustmentDialog> {
  // needs local state because its going to be used in a dialog, which does not get rebuilt
  late int localPitch;

  @override
  initState() {
    super.initState();
    localPitch = widget.pitch;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              localPitch -= 1;
            });

            widget.onPitchChanged(localPitch);
          },
          child: const Text("-"),
        ),
        const SizedBox(width: 24),
        Text("${localPitch}"),
        const SizedBox(width: 24),
        ElevatedButton(
          onPressed: () {
            setState(() {
              localPitch += 1;
            });
            widget.onPitchChanged(localPitch);
          },
          child: const Text("+"),
        ),
      ],
    );
  }
}
