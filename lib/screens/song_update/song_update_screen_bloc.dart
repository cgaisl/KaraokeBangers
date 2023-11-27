import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karaoke_bangers/data/song_repository.dart';
import 'package:karaoke_bangers/screens/song_new/song_new_screen_bloc.dart';
import 'package:karaoke_bangers/screens/song_update/song_update_screen_state.dart';
import 'package:karaoke_bangers/widgets/save_dialog.dart';

sealed class SongUpdateScreenEvent {}

class SongUpdateScreenEventArtistNameChanged extends SongUpdateScreenEvent {
  final String artistName;

  SongUpdateScreenEventArtistNameChanged(this.artistName);
}

class SongUpdateScreenEventSongNameChanged extends SongUpdateScreenEvent {
  final String songName;

  SongUpdateScreenEventSongNameChanged(this.songName);
}

class SongUpdateScreenEventAddLabel extends SongUpdateScreenEvent {
  final String label;

  SongUpdateScreenEventAddLabel(this.label);
}

class SongUpdateScreenEventLyricsChanged extends SongUpdateScreenEvent {
  final String lyrics;

  SongUpdateScreenEventLyricsChanged(this.lyrics);
}

class SongUpdateScreenEventCancel extends SongUpdateScreenEvent {}

class SongUpdateScreenEventSaveSong extends SongUpdateScreenEvent {}

class SongUpdateScreenEventPitchChanged extends SongUpdateScreenEvent {
  final int pitch;

  SongUpdateScreenEventPitchChanged(this.pitch);
}

class SongUpdateScreenEventRemoveLabel extends SongUpdateScreenEvent {
  final String label;

  SongUpdateScreenEventRemoveLabel(this.label);
}

class SongUpdateScreenEventDeleteSong extends SongUpdateScreenEvent {}

class SongUpdateScreenBloc
    extends Bloc<SongUpdateScreenEvent, SongUpdateScreenState> {
  final String songId;
  final Function() pop;
  final Function(bool Function(Route<dynamic>)) popUntil;
  final SongRepository songRepository;

  SongUpdateScreenBloc({
    required this.pop,
    required this.popUntil,
    required this.songRepository,
    required this.songId,
  }) : super(
          SongUpdateScreenStateExtension.fromSong(
              song: songRepository.songById(songId).value!),
        ) {
    on<SongUpdateScreenEventArtistNameChanged>((event, emit) {
      emit(state.copyWith(artistName: event.artistName));
    });

    on<SongUpdateScreenEventSongNameChanged>((event, emit) {
      emit(state.copyWith(songName: event.songName));
    });

    on<SongUpdateScreenEventAddLabel>((event, emit) {
      if(validateLabelInput(state.labels, event.label.trim())) {
        emit(state.copyWith(labels: [...state.labels, event.label.trim()]));
      }
    });

    on<SongUpdateScreenEventLyricsChanged>((event, emit) {
      emit(state.copyWith(lyrics: event.lyrics));
    });

    on<SongUpdateScreenEventCancel>((event, emit) {
      pop();
    });

    on<SongUpdateScreenEventPitchChanged>((event, emit) {
      emit(state.copyWith(pitch: event.pitch));
    });

    on<SongUpdateScreenEventRemoveLabel>((event, emit) {
      emit(state.copyWith(
        labels: state.labels.where((label) => label != event.label).toList(),
      ));
    });

    on<SongUpdateScreenEventDeleteSong>((event, emit) {
      songRepository.deleteSong(songId);
      popUntil(ModalRoute.withName('/'));
    });

    on<SongUpdateScreenEventSaveSong>((event, emit) {
      songRepository.updateSong(
        songRepository.songById(songId).value!.copyWith(
              songName: state.songName,
              artistName: state.artistName,
              pitchInfo: state.pitch,
              labels: state.labels,
              lyrics: state.lyrics,
            ),
      );
    });
  }

  bool _isStateDirty() {
    return state !=
        SongUpdateScreenStateExtension.fromSong(
          song: songRepository.songById(songId).value!,
        );
  }

  Future<bool> onBackNavigation(BuildContext context) async {
    if (!_isStateDirty()) {
      return true;
    } else {}

    final shouldPop = await showDialog(
      context: context,
      builder: (_) => AlertDialog(content: SaveDialog(
        onSave: () {
          add(SongUpdateScreenEventSaveSong());
        },
      )),
    );

    // in case the dialog was dismissed
    return shouldPop ?? false;
  }
}
