import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karaoke_bangers/di/di.dart';
import 'package:karaoke_bangers/screens/song_new/song_new_screen_bloc.dart';
import 'package:karaoke_bangers/screens/song_new/song_new_screen_state.dart';
import 'package:karaoke_bangers/widgets/edit_song/edit_song.dart';
import 'package:karaoke_bangers/widgets/edit_song/edit_song_events.dart';
import 'package:karaoke_bangers/widgets/edit_song/edit_song_state.dart';

class SongNewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SongNewScreenBloc(
        songRepository: songRepository,
        pop: Navigator.of(context).pop,
      ),
      child: BlocBuilder<SongNewScreenBloc, SongNewScreenState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: SongNewScreenContent(
                onEvent: (event) {
                  context.read<SongNewScreenBloc>().add(event);
                },
                state: state,
              ),
            ),
          );
        },
      ),
    );
  }
}

class SongNewScreenContent extends StatelessWidget {
  final Function(SongNewScreenEvent) onEvent;
  final SongNewScreenState state;

  const SongNewScreenContent({
    Key? key,
    required this.onEvent,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EditSong(
      state: EditSongState(
        screenTitle: "New Song",
        submitButtonTitle: "Create",
        artistName: state.artistName,
        songName: state.songName,
        labels: state.labels,
        lyrics: state.lyrics,
        pitch: state.pitch,
        canDelete: false,
      ),
      onEvent: (event) {
        switch (event) {
          case EditSongEventArtistNameChanged():
            onEvent(SongNewScreenEventArtistNameChanged(event.artistName));
          case EditSongEventSongNameChanged():
            onEvent(SongNewScreenEventSongNameChanged(event.songName));
          case EditSongEventAddLabel():
            onEvent(SongNewScreenEventAddLabel(event.label));
          case EditSongEventLyricsChanged():
            onEvent(SongNewScreenEventLyricsChanged(event.lyrics));
          case EditSongEventCancel():
            onEvent(SongNewScreenEventCancel());
          case EditSongEventSubmitSong():
            onEvent(SongNewScreenEventSaveSong());
          case EditSongEventPitchChanged():
            onEvent(SongNewScreenEventPitchChanged(event.pitch));
          case EditSongEventRemoveLabel():
            onEvent(SongNewScreenEventRemoveLabel(event.label));
          case EditSongEventDeleteSong():
          // Do nothing
        }
      },
    );
  }
}
