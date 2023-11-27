// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_new_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SongNewScreenState {
  String get songName => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  int get pitch => throw _privateConstructorUsedError;
  String get lyrics => throw _privateConstructorUsedError;
  List<String> get labels => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongNewScreenStateCopyWith<SongNewScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongNewScreenStateCopyWith<$Res> {
  factory $SongNewScreenStateCopyWith(
          SongNewScreenState value, $Res Function(SongNewScreenState) then) =
      _$SongNewScreenStateCopyWithImpl<$Res, SongNewScreenState>;
  @useResult
  $Res call(
      {String songName,
      String artistName,
      int pitch,
      String lyrics,
      List<String> labels});
}

/// @nodoc
class _$SongNewScreenStateCopyWithImpl<$Res, $Val extends SongNewScreenState>
    implements $SongNewScreenStateCopyWith<$Res> {
  _$SongNewScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songName = null,
    Object? artistName = null,
    Object? pitch = null,
    Object? lyrics = null,
    Object? labels = null,
  }) {
    return _then(_value.copyWith(
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as int,
      lyrics: null == lyrics
          ? _value.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongNewScreenStateImplCopyWith<$Res>
    implements $SongNewScreenStateCopyWith<$Res> {
  factory _$$SongNewScreenStateImplCopyWith(_$SongNewScreenStateImpl value,
          $Res Function(_$SongNewScreenStateImpl) then) =
      __$$SongNewScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String songName,
      String artistName,
      int pitch,
      String lyrics,
      List<String> labels});
}

/// @nodoc
class __$$SongNewScreenStateImplCopyWithImpl<$Res>
    extends _$SongNewScreenStateCopyWithImpl<$Res, _$SongNewScreenStateImpl>
    implements _$$SongNewScreenStateImplCopyWith<$Res> {
  __$$SongNewScreenStateImplCopyWithImpl(_$SongNewScreenStateImpl _value,
      $Res Function(_$SongNewScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songName = null,
    Object? artistName = null,
    Object? pitch = null,
    Object? lyrics = null,
    Object? labels = null,
  }) {
    return _then(_$SongNewScreenStateImpl(
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as int,
      lyrics: null == lyrics
          ? _value.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SongNewScreenStateImpl implements _SongNewScreenState {
  const _$SongNewScreenStateImpl(
      {this.songName = "",
      this.artistName = "",
      this.pitch = 0,
      this.lyrics = "",
      final List<String> labels = const []})
      : _labels = labels;

  @override
  @JsonKey()
  final String songName;
  @override
  @JsonKey()
  final String artistName;
  @override
  @JsonKey()
  final int pitch;
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
  String toString() {
    return 'SongNewScreenState(songName: $songName, artistName: $artistName, pitch: $pitch, lyrics: $lyrics, labels: $labels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongNewScreenStateImpl &&
            (identical(other.songName, songName) ||
                other.songName == songName) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.pitch, pitch) || other.pitch == pitch) &&
            (identical(other.lyrics, lyrics) || other.lyrics == lyrics) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @override
  int get hashCode => Object.hash(runtimeType, songName, artistName, pitch,
      lyrics, const DeepCollectionEquality().hash(_labels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongNewScreenStateImplCopyWith<_$SongNewScreenStateImpl> get copyWith =>
      __$$SongNewScreenStateImplCopyWithImpl<_$SongNewScreenStateImpl>(
          this, _$identity);
}

abstract class _SongNewScreenState implements SongNewScreenState {
  const factory _SongNewScreenState(
      {final String songName,
      final String artistName,
      final int pitch,
      final String lyrics,
      final List<String> labels}) = _$SongNewScreenStateImpl;

  @override
  String get songName;
  @override
  String get artistName;
  @override
  int get pitch;
  @override
  String get lyrics;
  @override
  List<String> get labels;
  @override
  @JsonKey(ignore: true)
  _$$SongNewScreenStateImplCopyWith<_$SongNewScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
