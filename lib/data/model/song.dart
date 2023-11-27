import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class Song with _$Song {
  const factory Song({
    required String id,
    required String artistName,
    required String songName,
    int? pitchInfo,
    String? lyrics,
    List<String>? labels,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}

// Serialization functions
String encodeSongs(List<Song> songs) => json.encode(
      songs.map<Map<String, dynamic>>((song) => song.toJson()).toList(),
    );

List<Song> decodeSongs(String songs) => (json.decode(songs) as List<dynamic>)
    .map<Song>((item) => Song.fromJson(item))
    .toList();
