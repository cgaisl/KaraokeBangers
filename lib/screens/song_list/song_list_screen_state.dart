import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karaoke_bangers/data/model/song.dart';

part 'song_list_screen_state.freezed.dart';

sealed class SortBarButtonRendering {}

class SortButtonRendering extends SortBarButtonRendering {
  final Function() onPressed;
  final bool selected;
  final String text;

  SortButtonRendering(this.text, this.selected, this.onPressed);
}

class LabelButtonRendering extends SortBarButtonRendering {
  final Function() onPressed;
  final bool selected;
  final String text;

  LabelButtonRendering(this.text, this.selected, this.onPressed);
}

class SortBarDivider extends SortBarButtonRendering {}

class SongListItemRendering {
  final String artistName;
  final String songName;
  final int pitch;
  final List<String> labels;
  final Function() onClicked;
  final Function(int) onPitchChanged;

  SongListItemRendering({
    required this.artistName,
    required this.songName,
    required this.pitch,
    required this.labels,
    required this.onClicked,
    required this.onPitchChanged,
  });
}

@freezed
class SongListScreenState with _$SongListScreenState {
  const factory SongListScreenState({
    @Default([]) List<SortBarButtonRendering> sortBarRenderings,
    @Default([]) List<SongListItemRendering> songListRenderings,
  }) = _SongListScreenState;
}

extension SongListItemRenderingExtension on SongListItemRendering {
  // function that creates a SongListItemRendering from a Song with named arguments

  static SongListItemRendering fromSong({
    required Song song,
    required Function(String) onClicked,
    required Function(int) onPitchChanged,
  }) {
    return SongListItemRendering(
      artistName: song.artistName,
      songName: song.songName,
      pitch: song.pitchInfo ?? 0,
      labels: song.labels ?? [],
      onClicked: () => onClicked(song.id),
      onPitchChanged: (pitch) => onPitchChanged(pitch),
    );
  }
}
