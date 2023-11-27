import 'package:flutter/material.dart';
import 'package:karaoke_bangers/widgets/pitch_adjustment_dialog.dart';

class PitchIndicator extends StatelessWidget {
  final int pitch;
  final Function(int) onPitchChanged;

  const PitchIndicator({
    Key? key,
    required this.pitch,
    required this.onPitchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pitchAsset = pitch < 0
        ? 'assets/music_flat.png'
        : pitch > 0
            ? 'assets/music_sharp.png'
            : "assets/plus_minus.png";

    final paddingWidth = pitch < 0 ? 4.0 : 8.0;

    return ElevatedButton(
      onPressed: () {
        // show dialog that contains only a text widget
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: PitchAdjustmentDialog(
              pitch: pitch,
              onPitchChanged: onPitchChanged,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Image(image: AssetImage(pitchAsset)),
          SizedBox(width: paddingWidth),
          Text(
            pitch.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
