// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_song_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditSongState {
  String get screenTitle => throw _privateConstructorUsedError;
  String get submitButtonTitle => throw _privateConstructorUsedError;
  bool get canDelete => throw _privateConstructorUsedError;
  String get songName => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  int get pitch => throw _privateConstructorUsedError;
  String get lyrics => throw _privateConstructorUsedError;
  List<String> get labels => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditSongStateCopyWith<EditSongState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditSongStateCopyWith<$Res> {
  factory $EditSongStateCopyWith(
          EditSongState value, $Res Function(EditSongState) then) =
      _$EditSongStateCopyWithImpl<$Res, EditSongState>;
  @useResult
  $Res call(
      {String screenTitle,
      String submitButtonTitle,
      bool canDelete,
      String songName,
      String artistName,
      int pitch,
      String lyrics,
      List<String> labels});
}

/// @nodoc
class _$EditSongStateCopyWithImpl<$Res, $Val extends EditSongState>
    implements $EditSongStateCopyWith<$Res> {
  _$EditSongStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenTitle = null,
    Object? submitButtonTitle = null,
    Object? canDelete = null,
    Object? songName = null,
    Object? artistName = null,
    Object? pitch = null,
    Object? lyrics = null,
    Object? labels = null,
  }) {
    return _then(_value.copyWith(
      screenTitle: null == screenTitle
          ? _value.screenTitle
          : screenTitle // ignore: cast_nullable_to_non_nullable
              as String,
      submitButtonTitle: null == submitButtonTitle
          ? _value.submitButtonTitle
          : submitButtonTitle // ignore: cast_nullable_to_non_nullable
              as String,
      canDelete: null == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$EditSongStateImplCopyWith<$Res>
    implements $EditSongStateCopyWith<$Res> {
  factory _$$EditSongStateImplCopyWith(
          _$EditSongStateImpl value, $Res Function(_$EditSongStateImpl) then) =
      __$$EditSongStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String screenTitle,
      String submitButtonTitle,
      bool canDelete,
      String songName,
      String artistName,
      int pitch,
      String lyrics,
      List<String> labels});
}

/// @nodoc
class __$$EditSongStateImplCopyWithImpl<$Res>
    extends _$EditSongStateCopyWithImpl<$Res, _$EditSongStateImpl>
    implements _$$EditSongStateImplCopyWith<$Res> {
  __$$EditSongStateImplCopyWithImpl(
      _$EditSongStateImpl _value, $Res Function(_$EditSongStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenTitle = null,
    Object? submitButtonTitle = null,
    Object? canDelete = null,
    Object? songName = null,
    Object? artistName = null,
    Object? pitch = null,
    Object? lyrics = null,
    Object? labels = null,
  }) {
    return _then(_$EditSongStateImpl(
      screenTitle: null == screenTitle
          ? _value.screenTitle
          : screenTitle // ignore: cast_nullable_to_non_nullable
              as String,
      submitButtonTitle: null == submitButtonTitle
          ? _value.submitButtonTitle
          : submitButtonTitle // ignore: cast_nullable_to_non_nullable
              as String,
      canDelete: null == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$EditSongStateImpl implements _EditSongState {
  const _$EditSongStateImpl(
      {required this.screenTitle,
      required this.submitButtonTitle,
      this.canDelete = false,
      this.songName = "",
      this.artistName = "",
      this.pitch = 0,
      this.lyrics = "",
      final List<String> labels = const []})
      : _labels = labels;

  @override
  final String screenTitle;
  @override
  final String submitButtonTitle;
  @override
  @JsonKey()
  final bool canDelete;
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
    return 'EditSongState(screenTitle: $screenTitle, submitButtonTitle: $submitButtonTitle, canDelete: $canDelete, songName: $songName, artistName: $artistName, pitch: $pitch, lyrics: $lyrics, labels: $labels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSongStateImpl &&
            (identical(other.screenTitle, screenTitle) ||
                other.screenTitle == screenTitle) &&
            (identical(other.submitButtonTitle, submitButtonTitle) ||
                other.submitButtonTitle == submitButtonTitle) &&
            (identical(other.canDelete, canDelete) ||
                other.canDelete == canDelete) &&
            (identical(other.songName, songName) ||
                other.songName == songName) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.pitch, pitch) || other.pitch == pitch) &&
            (identical(other.lyrics, lyrics) || other.lyrics == lyrics) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      screenTitle,
      submitButtonTitle,
      canDelete,
      songName,
      artistName,
      pitch,
      lyrics,
      const DeepCollectionEquality().hash(_labels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditSongStateImplCopyWith<_$EditSongStateImpl> get copyWith =>
      __$$EditSongStateImplCopyWithImpl<_$EditSongStateImpl>(this, _$identity);
}

abstract class _EditSongState implements EditSongState {
  const factory _EditSongState(
      {required final String screenTitle,
      required final String submitButtonTitle,
      final bool canDelete,
      final String songName,
      final String artistName,
      final int pitch,
      final String lyrics,
      final List<String> labels}) = _$EditSongStateImpl;

  @override
  String get screenTitle;
  @override
  String get submitButtonTitle;
  @override
  bool get canDelete;
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
  _$$EditSongStateImplCopyWith<_$EditSongStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
