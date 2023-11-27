import 'package:flutter/material.dart';
import 'package:karaoke_bangers/screens/song_list/song_list_screen_state.dart';
import 'package:karaoke_bangers/util/widget_list_extension.dart';
import 'package:karaoke_bangers/widgets/category_label.dart';
import 'package:karaoke_bangers/widgets/pitch_indicator.dart';

class SongListItem extends StatelessWidget {
  final SongListItemRendering rendering;

  const SongListItem(this.rendering);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        rendering.onClicked();
      },
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rendering.songName.isEmpty ? 'No title' : rendering.songName,
                  style: TextStyle(
                    fontSize: 17,
                    fontStyle:
                        rendering.songName.isEmpty ? FontStyle.italic : null,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  rendering.artistName.isEmpty
                      ? 'No artist'
                      : rendering.artistName,
                  style: TextStyle(
                      fontSize: 14,
                      fontStyle: rendering.artistName.isEmpty
                          ? FontStyle.italic
                          : null),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PitchIndicator(
            pitch: rendering.pitch,
            onPitchChanged: rendering.onPitchChanged,
          ),
          if (rendering.labels.isNotEmpty) ...[
            const SizedBox(width: 16),
            Column(
              children: rendering.labels
                  .map(
                    (label) => CategoryLabel(label),
                  )
                  .insertBetween(const SizedBox(height: 4)),
            ),
            const SizedBox(width: 16),
          ]
        ],
      ),
    );
  }
}
