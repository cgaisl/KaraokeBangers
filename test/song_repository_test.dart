import 'dart:convert';

import 'package:karaoke_bangers/data/model/song.dart';
import 'package:karaoke_bangers/data/song_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  late SharedPreferencesSongRepository repository;
  late SharedPreferences pref;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    pref = await SharedPreferences.getInstance();
    repository = SharedPreferencesSongRepository(pref);
  });

  test("addSong adds the song to the SharedPreferences", () async {
    const song = Song(
      id: "12",
      songName: "Test song name",
      artistName: "Test song artist",
    );

    await repository.addSong(song);

    await Future.delayed(Duration(milliseconds: 1000)); // wait for repository to add song

    final retrievedSong =
        Song.fromJson(jsonDecode((pref.getStringList('songs'))!.first));
    expect(song, retrievedSong);
  });

  test("updateSong updates the song in SharedPreferences", () async {
    const song = Song(
      id: "12",
      songName: "Test song name",
      artistName: "Test song artist",
    );

    await repository.addSong(song);

    const updatedSong = Song(
      id: "12",
      songName: "Updated song name",
      artistName: "Updated song artist",
    );

    await repository.updateSong(updatedSong);

    final retrievedSong =
        Song.fromJson(jsonDecode((pref.getStringList('songs'))!.first));
    expect(updatedSong, retrievedSong);
  });

  test("deleteSong deletes the song from SharedPreferences", () async {
    const song = Song(
      id: "12",
      songName: "Test song name",
      artistName: "Test song artist",
    );

    await repository.addSong(song);

    await repository.deleteSong(song.id);

    final retrievedSongs = pref.getStringList('songs');
    expect(retrievedSongs, isEmpty);
  });

  test("songById returns the song with the given id", () async {
    const song = Song(
      id: "12",
      songName: "Test song name",
      artistName: "Test song artist",
    );

    await repository.addSong(song);

    final retrievedSong = await repository
        .songById(song.id)
        .firstWhere((retrievedSong) => song == retrievedSong);
    expect(song, retrievedSong);
  });
}
