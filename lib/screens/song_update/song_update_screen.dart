import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karaoke_bangers/di/di.dart';
import 'package:karaoke_bangers/screens/song_update/song_update_screen_bloc.dart';
import 'package:karaoke_bangers/screens/song_update/song_update_screen_state.dart';
import 'package:karaoke_bangers/widgets/custom_will_pop_scope.dart';
import 'package:karaoke_bangers/widgets/edit_song/edit_song.dart';
import 'package:karaoke_bangers/widgets/edit_song/edit_song_events.dart';
import 'package:karaoke_bangers/widgets/edit_song/edit_song_state.dart';

class SongUpdateScreen extends StatelessWidget {
  final String songId;

  const SongUpdateScreen({
    Key? key,
    required this.songId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SongUpdateScreenBloc(
        songId: songId,
        songRepository: songRepository,
        pop: Navigator.of(context).pop,
        popUntil: (predicate) => Navigator.of(context).popUntil(predicate),
      ),
      child: Builder(
        builder: (context) {
          return CustomWillPopScope(
            onWillPop: () async {
              return context
                  .read<SongUpdateScreenBloc>()
                  .onBackNavigation(context);
            },
            child: BlocBuilder<SongUpdateScreenBloc, SongUpdateScreenState>(
              builder: (context, state) {
                return Scaffold(
                  backgroundColor: Colors.black,
                  body: SafeArea(
                    child: SongUpdateScreenContent(
                      onEvent: (event) {
                        context.read<SongUpdateScreenBloc>().add(event);
                      },
                      state: state,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class SongUpdateScreenContent extends StatelessWidget {
  final Function(SongUpdateScreenEvent) onEvent;
  final SongUpdateScreenState state;

  const SongUpdateScreenContent({
    Key? key,
    required this.onEvent,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EditSong(
      state: EditSongState(
        screenTitle: "Update Song",
        submitButtonTitle: "Save",
        artistName: state.artistName,
        songName: state.songName,
        labels: state.labels,
        lyrics: state.lyrics,
        pitch: state.pitch,
        canDelete: true,
      ),
      onEvent: (event) {
        switch (event) {
          case EditSongEventArtistNameChanged():
            onEvent(SongUpdateScreenEventArtistNameChanged(event.artistName));
            break;
          case EditSongEventSongNameChanged():
            onEvent(SongUpdateScreenEventSongNameChanged(event.songName));
            break;
          case EditSongEventAddLabel():
            onEvent(SongUpdateScreenEventAddLabel(event.label));
            break;
          case EditSongEventLyricsChanged():
            onEvent(SongUpdateScreenEventLyricsChanged(event.lyrics));
            break;
          case EditSongEventCancel():
            onEvent(SongUpdateScreenEventCancel());
            break;
          case EditSongEventPitchChanged():
            onEvent(SongUpdateScreenEventPitchChanged(event.pitch));
            break;
          case EditSongEventRemoveLabel():
            onEvent(SongUpdateScreenEventRemoveLabel(event.label));
            break;
          case EditSongEventDeleteSong():
            onEvent(SongUpdateScreenEventDeleteSong());
            break;
          case EditSongEventSubmitSong():
            onEvent(SongUpdateScreenEventSaveSong());
            context.pop();
            break;
        }
      },
    );
  }
}
