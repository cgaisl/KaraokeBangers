import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karaoke_bangers/widgets/song_list.dart';
import 'package:karaoke_bangers/screens/song_list/song_list_screen_bloc.dart';
import 'package:karaoke_bangers/screens/song_list/song_list_screen_state.dart';
import 'package:karaoke_bangers/widgets/sort_bar.dart';

import '../../di/di.dart';

class SongListScreen extends StatelessWidget {
  const SongListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SongListScreenBloc(
        songRepository: songRepository,
        navigate: (destination) {
          context.push(destination);
        },
      ),
      child: BlocBuilder<SongListScreenBloc, SongListScreenState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: SongListScreenContent(
                  onEvent: (event) {
                    context.read<SongListScreenBloc>().add(event);
                  },
                  state: state,
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context
                      .read<SongListScreenBloc>()
                      .add(SongListScreeEventOnNewSongClicked());
                },
                child: const Icon(Icons.add),
              ));
        },
      ),
    );
  }
}

class SongListScreenContent extends StatelessWidget {
  final Function(SongListScreenEvent) onEvent;
  final SongListScreenState state;

  const SongListScreenContent({
    Key? key,
    required this.onEvent,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SortBar(sortBarButtonRenderings: state.sortBarRenderings),
        Divider(color: Colors.white, thickness: 1, height: 1),
        Expanded(
            child: SongList(songListItemRenderings: state.songListRenderings)),
      ],
    );
  }
}
