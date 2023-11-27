import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karaoke_bangers/data/model/song.dart';
import 'package:karaoke_bangers/data/song_repository.dart';
import 'package:karaoke_bangers/screens/song_list/song_list_screen_state.dart';

sealed class SongListScreenEvent {}

class _SongListUpdated extends SongListScreenEvent {
  final List<Song> songs;

  _SongListUpdated(this.songs);
}

class SongListScreenEventOnSortClicked extends SongListScreenEvent {
  final SortEnum sortBy;

  SongListScreenEventOnSortClicked(this.sortBy);
}

class SongListScreenEventOnFilterClicked extends SongListScreenEvent {
  final String filterBy;

  SongListScreenEventOnFilterClicked(this.filterBy);
}

class SongListScreeEventOnNewSongClicked extends SongListScreenEvent {}

enum SortEnum {
  title,
  artist,
}

class SongListScreenBloc
    extends Bloc<SongListScreenEvent, SongListScreenState> {
  final SongRepository songRepository;
  late StreamSubscription<List<Song>> _songSubscription;
  final Function(String) navigate;

  SortEnum _sortBy = SortEnum.title;
  String _filterBy = "";

  SongListScreenBloc({ required this.songRepository, required this.navigate})
      : super(SongListScreenState()) {
    _songSubscription = songRepository.allSongs.listen(
      (songs) => add(_SongListUpdated(songs)),
    );

    on<_SongListUpdated>(
      (event, emit) {
        emit(state.copyWith(
          sortBarRenderings: [
            SortButtonRendering(
              "Title",
              _sortBy == SortEnum.title,
              () => add(SongListScreenEventOnSortClicked(SortEnum.title)),
            ),
            SortButtonRendering(
              "Artist",
              _sortBy == SortEnum.artist,
              () => add(SongListScreenEventOnSortClicked(SortEnum.artist)),
            ),
            SortBarDivider(),
            ...songRepository.allSongs.value
                .map((song) => song.labels ?? [])
                .expand((element) => element)
                .toSet()
                .sortedBy((label) => label.toLowerCase())
                .map((label) => LabelButtonRendering(
                      label,
                      _filterBy == label,
                      () => add(SongListScreenEventOnFilterClicked(label)),
                    ))
                .toList()
                .sortedBy((element) => element.selected ? "0" : "1")
                .toList(),
          ],
          songListRenderings: event.songs
              .where((song) =>
                  _filterBy.isEmpty ||
                  (song.labels ?? []).any((label) => _filterBy.contains(label)))
              .toList()
              .sortedBy((song) => _sortBy == SortEnum.artist
                  ? song.artistName.toLowerCase()
                  : song.songName.toLowerCase())
              .map((song) => SongListItemRenderingExtension.fromSong(
                    song: song,
                    onClicked: (id) {
                      navigate('/song/$id');
                    },
                    onPitchChanged: (pitch) {
                      songRepository
                          .updateSong(song.copyWith(pitchInfo: pitch));
                    },
                  ))
              .toList(),
        ));
      },
    );

    on<SongListScreenEventOnSortClicked>((event, emit) {
      _sortBy = event.sortBy;
      add(_SongListUpdated(songRepository.allSongs.value));
    });

    on<SongListScreenEventOnFilterClicked>((event, emit) {
      _filterBy = _filterBy == event.filterBy ? "" : event.filterBy;
      add(_SongListUpdated(songRepository.allSongs.value));
    });

    on<SongListScreeEventOnNewSongClicked>((event, emit) {
      _filterBy = "";
      add(_SongListUpdated(songRepository.allSongs.value));
      navigate('/song/new');
    });
  }

  @override
  Future<void> close() {
    _songSubscription.cancel();
    return super.close();
  }
}
