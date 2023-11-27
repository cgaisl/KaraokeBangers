// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_detail_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SongDetailScreenState {
  String get songId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get artist => throw _privateConstructorUsedError;
  String get lyrics => throw _privateConstructorUsedError;
  List<String> get labels => throw _privateConstructorUsedError;
  int get pitch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongDetailScreenStateCopyWith<SongDetailScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongDetailScreenStateCopyWith<$Res> {
  factory $SongDetailScreenStateCopyWith(SongDetailScreenState value,
          $Res Function(SongDetailScreenState) then) =
      _$SongDetailScreenStateCopyWithImpl<$Res, SongDetailScreenState>;
  @useResult
  $Res call(
      {String songId,
      String title,
      String artist,
      String lyrics,
      List<String> labels,
      int pitch});
}

/// @nodoc
class _$SongDetailScreenStateCopyWithImpl<$Res,
        $Val extends SongDetailScreenState>
    implements $SongDetailScreenStateCopyWith<$Res> {
  _$SongDetailScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = null,
    Object? title = null,
    Object? artist = null,
    Object? lyrics = null,
    Object? labels = null,
    Object? pitch = null,
  }) {
    return _then(_value.copyWith(
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      lyrics: null == lyrics
          ? _value.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongDetailScreenStateImplCopyWith<$Res>
    implements $SongDetailScreenStateCopyWith<$Res> {
  factory _$$SongDetailScreenStateImplCopyWith(
          _$SongDetailScreenStateImpl value,
          $Res Function(_$SongDetailScreenStateImpl) then) =
      __$$SongDetailScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String songId,
      String title,
      String artist,
      String lyrics,
      List<String> labels,
      int pitch});
}

/// @nodoc
class __$$SongDetailScreenStateImplCopyWithImpl<$Res>
    extends _$SongDetailScreenStateCopyWithImpl<$Res,
        _$SongDetailScreenStateImpl>
    implements _$$SongDetailScreenStateImplCopyWith<$Res> {
  __$$SongDetailScreenStateImplCopyWithImpl(_$SongDetailScreenStateImpl _value,
      $Res Function(_$SongDetailScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = null,
    Object? title = null,
    Object? artist = null,
    Object? lyrics = null,
    Object? labels = null,
    Object? pitch = null,
  }) {
    return _then(_$SongDetailScreenStateImpl(
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      lyrics: null == lyrics
          ? _value.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SongDetailScreenStateImpl implements _SongDetailScreenState {
  const _$SongDetailScreenStateImpl(
      {this.songId = "",
      this.title = "",
      this.artist = "",
      this.lyrics = "",
      final List<String> labels = const [],
      this.pitch = 0})
      : _labels = labels;

  @override
  @JsonKey()
  final String songId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String artist;
  @override
  @JsonKey()
  final String lyrics;
  final List<String> _labels;
  @override
  @JsonKey()
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  @JsonKey()
  final int pitch;

  @override
  String toString() {
    return 'SongDetailScreenState(songId: $songId, title: $title, artist: $artist, lyrics: $lyrics, labels: $labels, pitch: $pitch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongDetailScreenStateImpl &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.lyrics, lyrics) || other.lyrics == lyrics) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.pitch, pitch) || other.pitch == pitch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, songId, title, artist, lyrics,
      const DeepCollectionEquality().hash(_labels), pitch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongDetailScreenStateImplCopyWith<_$SongDetailScreenStateImpl>
      get copyWith => __$$SongDetailScreenStateImplCopyWithImpl<
          _$SongDetailScreenStateImpl>(this, _$identity);
}

abstract class _SongDetailScreenState implements SongDetailScreenState {
  const factory _SongDetailScreenState(
      {final String songId,
      final String title,
      final String artist,
      final String lyrics,
      final List<String> labels,
      final int pitch}) = _$SongDetailScreenStateImpl;

  @override
  String get songId;
  @override
  String get title;
  @override
  String get artist;
  @override
  String get lyrics;
  @override
  List<String> get labels;
  @override
  int get pitch;
  @override
  @JsonKey(ignore: true)
  _$$SongDetailScreenStateImplCopyWith<_$SongDetailScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
