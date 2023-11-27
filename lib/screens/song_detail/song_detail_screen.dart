import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karaoke_bangers/di/di.dart';
import 'package:karaoke_bangers/screens/song_detail/song_detail_screen_bloc.dart';
import 'package:karaoke_bangers/screens/song_detail/song_detail_screen_state.dart';
import 'package:karaoke_bangers/util/widget_list_extension.dart';
import 'package:karaoke_bangers/widgets/banger_navigation_bar.dart';
import 'package:karaoke_bangers/widgets/category_label.dart';
import 'package:karaoke_bangers/widgets/pitch_indicator.dart';

class SongDetailScreen extends StatelessWidget {
  final String songId;

  const SongDetailScreen({
    Key? key,
    required this.songId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SongDetailScreenBloc(
        songId: songId,
        songRepository: songRepository,
      ),
      child: BlocBuilder<SongDetailScreenBloc, SongDetailScreenState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: SongDetailScreenContent(
                onEvent: (event) {
                  context.read<SongDetailScreenBloc>().add(event);
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

class SongDetailScreenContent extends StatelessWidget {
  final Function(SongDetailScreenEvent) onEvent;
  final SongDetailScreenState state;

  const SongDetailScreenContent({
    Key? key,
    required this.onEvent,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _NavigationBar(state: state),
        _LabelSection(state: state, onEvent: onEvent),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  state.lyrics.isEmpty ? 'No lyrics' : state.lyrics,
                  style: TextStyle(
                      fontSize: 14,
                      fontStyle:
                          state.lyrics.isEmpty ? FontStyle.italic : null),
                  textAlign: TextAlign.left,
                  maxLines: null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LabelSection extends StatelessWidget {
  const _LabelSection({
    required this.state,
    required this.onEvent,
  });

  final SongDetailScreenState state;
  final Function(SongDetailScreenEvent) onEvent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          if (state.labels.isEmpty)
            const Text(
              "No labels",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
            ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var category in state.labels) CategoryLabel(category),
                ].insertBetween(const SizedBox(width: 8)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          PitchIndicator(
            pitch: state.pitch,
            onPitchChanged: (pitch) {
              onEvent(SongDetailScreenEventPitchChanged(pitch));
            },
          ),
        ],
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    required this.state,
  });

  final SongDetailScreenState state;

  @override
  Widget build(BuildContext context) {
    return BangerNavigationBar(
      titleWidget: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.title.isEmpty ? 'No title' : state.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontStyle: state.title.isEmpty ? FontStyle.italic : null,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              state.artist.isEmpty ? 'No artist' : state.artist,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontStyle: state.artist.isEmpty ? FontStyle.italic : null),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      actionsWidget: IconButton(
        onPressed: () {
          // navigate to song update screen
          context.push('/song/update/${state.songId}');
        },
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
