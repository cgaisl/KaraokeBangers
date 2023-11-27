import 'package:flutter/material.dart';
import 'package:karaoke_bangers/screens/song_list/song_list_screen_state.dart';
import 'package:karaoke_bangers/widgets/song_list_item.dart';

class SongList extends StatelessWidget {
  final List<SongListItemRendering> songListItemRenderings;

  SongList({super.key, required this.songListItemRenderings});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: songListItemRenderings
          .map(
            (rendering) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SongListItem(rendering),
                ),
                const Divider(color: Colors.white, thickness: 1, height: 1),
              ],
            ),
          )
          .toList(),
    );
  }
}
