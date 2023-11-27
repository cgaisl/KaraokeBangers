import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karaoke_bangers/data/model/song.dart';
import 'package:karaoke_bangers/data/song_repository.dart';
import 'package:karaoke_bangers/screens/song_detail/song_detail_screen_state.dart';

sealed class SongDetailScreenEvent {}

class SongDetailScreenEventPitchChanged extends SongDetailScreenEvent {
  final int pitch;

  SongDetailScreenEventPitchChanged(this.pitch);
}

class SongDetailScreenOnEditLablelsClicked extends SongDetailScreenEvent {}

class _SongDetailScreenOnSongUpdated extends SongDetailScreenEvent {
  final Song song;

  _SongDetailScreenOnSongUpdated(this.song);
}

class SongDetailScreenBloc
    extends Bloc<SongDetailScreenEvent, SongDetailScreenState> {
  final String songId;
  final SongRepository songRepository;

  late StreamSubscription<Song?> _songSubscription;

  SongDetailScreenBloc({
    required this.songId,
    required this.songRepository,
  }) : super(SongDetailScreenStateExtension.fromSong(
            song: songRepository.songById(songId).value!)) {
    _songSubscription = songRepository.songById(songId).listen(
      (song) {
        if (song != null) add(_SongDetailScreenOnSongUpdated(song));
      },
    );

    on<_SongDetailScreenOnSongUpdated>(
      (event, emit) => emit(
        SongDetailScreenStateExtension.fromSong(
          song: event.song,
        ),
      ),
    );

    on<SongDetailScreenEventPitchChanged>((event, emit) {
      songRepository.updateSong(
        songRepository.songById(songId).value!.copyWith(pitchInfo: event.pitch),
      );
      emit(state.copyWith(pitch: event.pitch));
    });
  }

  @override
  Future<void> close() {
    _songSubscription.cancel();
    return super.close();
  }
}
