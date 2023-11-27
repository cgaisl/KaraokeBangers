import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karaoke_bangers/data/model/song.dart';

part 'song_update_screen_state.freezed.dart';

@freezed
class SongUpdateScreenState with _$SongUpdateScreenState {
  const factory SongUpdateScreenState({
    @Default("") String songName,
    @Default("") String artistName,
    @Default(0) int pitch,
    @Default("") String lyrics,
    @Default([]) List<String> labels,
  }) = _SongUpdateScreenState;
}

extension SongUpdateScreenStateExtension on SongUpdateScreenState {
  static SongUpdateScreenState fromSong({required Song song}) {
    return SongUpdateScreenState(
      songName: song.songName,
      artistName: song.artistName,
      pitch: song.pitchInfo ?? 0,
      lyrics: song.lyrics ?? "",
      labels: song.labels ?? [],
    );
  }
}
