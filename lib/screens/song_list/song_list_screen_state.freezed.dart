// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_list_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SongListScreenState {
  List<SortBarButtonRendering> get sortBarRenderings =>
      throw _privateConstructorUsedError;
  List<SongListItemRendering> get songListRenderings =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongListScreenStateCopyWith<SongListScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongListScreenStateCopyWith<$Res> {
  factory $SongListScreenStateCopyWith(
          SongListScreenState value, $Res Function(SongListScreenState) then) =
      _$SongListScreenStateCopyWithImpl<$Res, SongListScreenState>;
  @useResult
  $Res call(
      {List<SortBarButtonRendering> sortBarRenderings,
      List<SongListItemRendering> songListRenderings});
}

/// @nodoc
class _$SongListScreenStateCopyWithImpl<$Res, $Val extends SongListScreenState>
    implements $SongListScreenStateCopyWith<$Res> {
  _$SongListScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortBarRenderings = null,
    Object? songListRenderings = null,
  }) {
    return _then(_value.copyWith(
      sortBarRenderings: null == sortBarRenderings
          ? _value.sortBarRenderings
          : sortBarRenderings // ignore: cast_nullable_to_non_nullable
              as List<SortBarButtonRendering>,
      songListRenderings: null == songListRenderings
          ? _value.songListRenderings
          : songListRenderings // ignore: cast_nullable_to_non_nullable
              as List<SongListItemRendering>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongListScreenStateImplCopyWith<$Res>
    implements $SongListScreenStateCopyWith<$Res> {
  factory _$$SongListScreenStateImplCopyWith(_$SongListScreenStateImpl value,
          $Res Function(_$SongListScreenStateImpl) then) =
      __$$SongListScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SortBarButtonRendering> sortBarRenderings,
      List<SongListItemRendering> songListRenderings});
}

/// @nodoc
class __$$SongListScreenStateImplCopyWithImpl<$Res>
    extends _$SongListScreenStateCopyWithImpl<$Res, _$SongListScreenStateImpl>
    implements _$$SongListScreenStateImplCopyWith<$Res> {
  __$$SongListScreenStateImplCopyWithImpl(_$SongListScreenStateImpl _value,
      $Res Function(_$SongListScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortBarRenderings = null,
    Object? songListRenderings = null,
  }) {
    return _then(_$SongListScreenStateImpl(
      sortBarRenderings: null == sortBarRenderings
          ? _value._sortBarRenderings
          : sortBarRenderings // ignore: cast_nullable_to_non_nullable
              as List<SortBarButtonRendering>,
      songListRenderings: null == songListRenderings
          ? _value._songListRenderings
          : songListRenderings // ignore: cast_nullable_to_non_nullable
              as List<SongListItemRendering>,
    ));
  }
}

/// @nodoc

class _$SongListScreenStateImpl implements _SongListScreenState {
  const _$SongListScreenStateImpl(
      {final List<SortBarButtonRendering> sortBarRenderings = const [],
      final List<SongListItemRendering> songListRenderings = const []})
      : _sortBarRenderings = sortBarRenderings,
        _songListRenderings = songListRenderings;

  final List<SortBarButtonRendering> _sortBarRenderings;
  @override
  @JsonKey()
  List<SortBarButtonRendering> get sortBarRenderings {
    if (_sortBarRenderings is EqualUnmodifiableListView)
      return _sortBarRenderings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sortBarRenderings);
  }

  final List<SongListItemRendering> _songListRenderings;
  @override
  @JsonKey()
  List<SongListItemRendering> get songListRenderings {
    if (_songListRenderings is EqualUnmodifiableListView)
      return _songListRenderings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songListRenderings);
  }

  @override
  String toString() {
    return 'SongListScreenState(sortBarRenderings: $sortBarRenderings, songListRenderings: $songListRenderings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongListScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._sortBarRenderings, _sortBarRenderings) &&
            const DeepCollectionEquality()
                .equals(other._songListRenderings, _songListRenderings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sortBarRenderings),
      const DeepCollectionEquality().hash(_songListRenderings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongListScreenStateImplCopyWith<_$SongListScreenStateImpl> get copyWith =>
      __$$SongListScreenStateImplCopyWithImpl<_$SongListScreenStateImpl>(
          this, _$identity);
}

abstract class _SongListScreenState implements SongListScreenState {
  const factory _SongListScreenState(
          {final List<SortBarButtonRendering> sortBarRenderings,
          final List<SongListItemRendering> songListRenderings}) =
      _$SongListScreenStateImpl;

  @override
  List<SortBarButtonRendering> get sortBarRenderings;
  @override
  List<SongListItemRendering> get songListRenderings;
  @override
  @JsonKey(ignore: true)
  _$$SongListScreenStateImplCopyWith<_$SongListScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
