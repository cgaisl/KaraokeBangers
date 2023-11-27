import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:karaoke_bangers/data/model/song.dart';

part 'song_detail_screen_state.freezed.dart';

@freezed
class SongDetailScreenState with _$SongDetailScreenState {
  const factory SongDetailScreenState({
    @Default("") String songId,
    @Default("") String title,
    @Default("") String artist,
    @Default("") String lyrics,
    @Default([]) List<String> labels,
    @Default(0) int pitch,
  }) = _SongDetailScreenState;
}

extension SongDetailScreenStateExtension on SongDetailScreenState {
  static SongDetailScreenState fromSong({required Song song}) {
    return SongDetailScreenState(
      songId: song.id,
      title: song.songName,
      artist: song.artistName,
      lyrics: song.lyrics ?? "",
      labels: song.labels ?? [],
      pitch: song.pitchInfo ?? 0,
    );
  }
}
