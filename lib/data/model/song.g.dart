// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongImpl _$$SongImplFromJson(Map<String, dynamic> json) => _$SongImpl(
      id: json['id'] as String,
      artistName: json['artistName'] as String,
      songName: json['songName'] as String,
      pitchInfo: json['pitchInfo'] as int?,
      lyrics: json['lyrics'] as String?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$SongImplToJson(_$SongImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'artistName': instance.artistName,
      'songName': instance.songName,
      'pitchInfo': instance.pitchInfo,
      'lyrics': instance.lyrics,
      'labels': instance.labels,
    };
