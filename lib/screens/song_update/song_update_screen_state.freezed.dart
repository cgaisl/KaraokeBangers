// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_update_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SongUpdateScreenState {
  String get songName => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  int get pitch => throw _privateConstructorUsedError;
  String get lyrics => throw _privateConstructorUsedError;
  List<String> get labels => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongUpdateScreenStateCopyWith<SongUpdateScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongUpdateScreenStateCopyWith<$Res> {
  factory $SongUpdateScreenStateCopyWith(SongUpdateScreenState value,
          $Res Function(SongUpdateScreenState) then) =
      _$SongUpdateScreenStateCopyWithImpl<$Res, SongUpdateScreenState>;
  @useResult
  $Res call(
      {String songName,
      String artistName,
      int pitch,
      String lyrics,
      List<String> labels});
}

/// @nodoc
class _$SongUpdateScreenStateCopyWithImpl<$Res,
        $Val extends SongUpdateScreenState>
    implements $SongUpdateScreenStateCopyWith<$Res> {
  _$SongUpdateScreenStateCopyWithImpl(this._value, this._then);

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
abstract class _$$SongUpdateScreenStateImplCopyWith<$Res>
    implements $SongUpdateScreenStateCopyWith<$Res> {
  factory _$$SongUpdateScreenStateImplCopyWith(
          _$SongUpdateScreenStateImpl value,
          $Res Function(_$SongUpdateScreenStateImpl) then) =
      __$$SongUpdateScreenStateImplCopyWithImpl<$Res>;
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
class __$$SongUpdateScreenStateImplCopyWithImpl<$Res>
    extends _$SongUpdateScreenStateCopyWithImpl<$Res,
        _$SongUpdateScreenStateImpl>
    implements _$$SongUpdateScreenStateImplCopyWith<$Res> {
  __$$SongUpdateScreenStateImplCopyWithImpl(_$SongUpdateScreenStateImpl _value,
      $Res Function(_$SongUpdateScreenStateImpl) _then)
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
    return _then(_$SongUpdateScreenStateImpl(
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

class _$SongUpdateScreenStateImpl implements _SongUpdateScreenState {
  const _$SongUpdateScreenStateImpl(
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
    return 'SongUpdateScreenState(songName: $songName, artistName: $artistName, pitch: $pitch, lyrics: $lyrics, labels: $labels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongUpdateScreenStateImpl &&
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
  _$$SongUpdateScreenStateImplCopyWith<_$SongUpdateScreenStateImpl>
      get copyWith => __$$SongUpdateScreenStateImplCopyWithImpl<
          _$SongUpdateScreenStateImpl>(this, _$identity);
}

abstract class _SongUpdateScreenState implements SongUpdateScreenState {
  const factory _SongUpdateScreenState(
      {final String songName,
      final String artistName,
      final int pitch,
      final String lyrics,
      final List<String> labels}) = _$SongUpdateScreenStateImpl;

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
  _$$SongUpdateScreenStateImplCopyWith<_$SongUpdateScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
