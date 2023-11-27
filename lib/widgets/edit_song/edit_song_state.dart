import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_song_state.freezed.dart';

@freezed
class EditSongState with _$EditSongState {
  const factory EditSongState({
    required String screenTitle,
    required String submitButtonTitle,
    @Default(false) bool canDelete,
    @Default("") String songName,
    @Default("") String artistName,
    @Default(0) int pitch,
    @Default("") String lyrics,
    @Default([]) List<String> labels,
  }) = _EditSongState;
}
