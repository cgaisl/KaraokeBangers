import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karaoke_bangers/data/model/song.dart';
import 'package:karaoke_bangers/data/song_repository.dart';
import 'package:karaoke_bangers/screens/song_new/song_new_screen_state.dart';
import 'package:uuid/uuid.dart';

sealed class SongNewScreenEvent {}

class SongNewScreenEventArtistNameChanged extends SongNewScreenEvent {
  final String artistName;

  SongNewScreenEventArtistNameChanged(this.artistName);
}

class SongNewScreenEventSongNameChanged extends SongNewScreenEvent {
  final String songName;

  SongNewScreenEventSongNameChanged(this.songName);
}

class SongNewScreenEventAddLabel extends SongNewScreenEvent {
  final String label;

  SongNewScreenEventAddLabel(this.label);
}

class SongNewScreenEventLyricsChanged extends SongNewScreenEvent {
  final String lyrics;

  SongNewScreenEventLyricsChanged(this.lyrics);
}

class SongNewScreenEventCancel extends SongNewScreenEvent {}

class SongNewScreenEventSaveSong extends SongNewScreenEvent {}

class SongNewScreenEventPitchChanged extends SongNewScreenEvent {
  final int pitch;

  SongNewScreenEventPitchChanged(this.pitch);
}

class SongNewScreenEventRemoveLabel extends SongNewScreenEvent {
  final String label;

  SongNewScreenEventRemoveLabel(this.label);
}

class SongNewScreenBloc extends Bloc<SongNewScreenEvent, SongNewScreenState> {
  final Function() pop;
  final SongRepository songRepository;

  SongNewScreenBloc({
    required this.songRepository,
    required this.pop,
  }) : super(const SongNewScreenState()) {
    on<SongNewScreenEventArtistNameChanged>((event, emit) {
      emit(state.copyWith(artistName: event.artistName));
    });

    on<SongNewScreenEventSongNameChanged>((event, emit) {
      emit(state.copyWith(songName: event.songName));
    });

    on<SongNewScreenEventAddLabel>((event, emit) {
      if (validateLabelInput(state.labels, event.label.trim())) {
        emit(state.copyWith(labels: [...state.labels, event.label.trim()]));
      }
    });

    on<SongNewScreenEventLyricsChanged>((event, emit) {
      emit(state.copyWith(lyrics: event.lyrics));
    });

    on<SongNewScreenEventCancel>((event, emit) {
      pop();
    });

    on<SongNewScreenEventPitchChanged>((event, emit) {
      emit(state.copyWith(pitch: event.pitch));
    });

    on<SongNewScreenEventRemoveLabel>((event, emit) {
      emit(state.copyWith(
        labels: state.labels.where((label) => label != event.label).toList(),
      ));
    });

    on<SongNewScreenEventSaveSong>((event, emit) {
      songRepository.addSong(
        Song(
          id: Uuid().v4(),
          songName: state.songName,
          artistName: state.artistName,
          pitchInfo: state.pitch,
          labels: state.labels,
          lyrics: state.lyrics,
        ),
      );
      pop();
    });
  }
}

bool validateLabelInput(List<String> currentLabels, String newLabel) {
  return newLabel.isNotEmpty && !currentLabels.contains(newLabel);
}
