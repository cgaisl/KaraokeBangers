import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:karaoke_bangers/data/model/song.dart';
import 'package:karaoke_bangers/util/value_stream_extension.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SongRepository {
  ValueStream<List<Song>> get allSongs;

  Future<void> addSong(Song song);

  Future<void> updateSong(Song song);

  Future<void> deleteSong(String songId);

  ValueStream<Song?> songById(String id);
}

class SharedPreferencesSongRepository implements SongRepository {
  final _songKey = 'songs';
  late final BehaviorSubject<List<Song>> _songsSubject;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  SharedPreferencesSongRepository(SharedPreferences prefs) {
    _songsSubject = BehaviorSubject.seeded(
      prefs
              .getStringList(_songKey)
              ?.map((songJson) => Song.fromJson(jsonDecode(songJson)))
              .toList() ??
          [],
    );

    _songsSubject.listen((value) {
      prefs.setStringList(
          _songKey, value.map((song) => jsonEncode(song)).toList());
    }).addTo(_compositeSubscription);
  }

  @override
  ValueStream<List<Song>> get allSongs => _songsSubject;

  @override
  ValueStream<Song?> songById(String id) {
    return allSongs.mapValueStream((songs) {
      return songs.firstWhereOrNull((song) => song.id == id);
    });
  }

  @override
  Future<void> addSong(Song song) async {
    _songsSubject.add([..._songsSubject.value, song]);
  }

  @override
  Future<void> updateSong(Song updatedSong) async {
    _songsSubject.add(_songsSubject.value
        .map((song) => song.id == updatedSong.id ? updatedSong : song)
        .toList());
  }

  @override
  Future<void> deleteSong(String songId) async {
    _songsSubject
        .add(_songsSubject.value.where((song) => song.id != songId).toList());
  }
}
