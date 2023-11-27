import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_new_screen_state.freezed.dart';

@freezed
class SongNewScreenState with _$SongNewScreenState {
  const factory SongNewScreenState({
    @Default("") String songName,
    @Default("") String artistName,
    @Default(0) int pitch,
    @Default("") String lyrics,
    @Default([]) List<String> labels,
  }) = _SongNewScreenState;
}
