// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tutorial_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TutorialModel _$TutorialModelFromJson(Map<String, dynamic> json) {
  return _TutorialModel.fromJson(json);
}

/// @nodoc
mixin _$TutorialModel {
  String get videoLink => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get rounds => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TutorialModelCopyWith<TutorialModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorialModelCopyWith<$Res> {
  factory $TutorialModelCopyWith(
          TutorialModel value, $Res Function(TutorialModel) then) =
      _$TutorialModelCopyWithImpl<$Res, TutorialModel>;
  @useResult
  $Res call({String videoLink, String title, int rounds, String thumbnail});
}

/// @nodoc
class _$TutorialModelCopyWithImpl<$Res, $Val extends TutorialModel>
    implements $TutorialModelCopyWith<$Res> {
  _$TutorialModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoLink = null,
    Object? title = null,
    Object? rounds = null,
    Object? thumbnail = null,
  }) {
    return _then(_value.copyWith(
      videoLink: null == videoLink
          ? _value.videoLink
          : videoLink // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rounds: null == rounds
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TutorialModelCopyWith<$Res>
    implements $TutorialModelCopyWith<$Res> {
  factory _$$_TutorialModelCopyWith(
          _$_TutorialModel value, $Res Function(_$_TutorialModel) then) =
      __$$_TutorialModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String videoLink, String title, int rounds, String thumbnail});
}

/// @nodoc
class __$$_TutorialModelCopyWithImpl<$Res>
    extends _$TutorialModelCopyWithImpl<$Res, _$_TutorialModel>
    implements _$$_TutorialModelCopyWith<$Res> {
  __$$_TutorialModelCopyWithImpl(
      _$_TutorialModel _value, $Res Function(_$_TutorialModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoLink = null,
    Object? title = null,
    Object? rounds = null,
    Object? thumbnail = null,
  }) {
    return _then(_$_TutorialModel(
      videoLink: null == videoLink
          ? _value.videoLink
          : videoLink // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rounds: null == rounds
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TutorialModel implements _TutorialModel {
  const _$_TutorialModel(
      {required this.videoLink,
      required this.title,
      this.rounds = 1,
      required this.thumbnail});

  factory _$_TutorialModel.fromJson(Map<String, dynamic> json) =>
      _$$_TutorialModelFromJson(json);

  @override
  final String videoLink;
  @override
  final String title;
  @override
  @JsonKey()
  final int rounds;
  @override
  final String thumbnail;

  @override
  String toString() {
    return 'TutorialModel(videoLink: $videoLink, title: $title, rounds: $rounds, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TutorialModel &&
            (identical(other.videoLink, videoLink) ||
                other.videoLink == videoLink) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rounds, rounds) || other.rounds == rounds) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, videoLink, title, rounds, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TutorialModelCopyWith<_$_TutorialModel> get copyWith =>
      __$$_TutorialModelCopyWithImpl<_$_TutorialModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TutorialModelToJson(
      this,
    );
  }
}

abstract class _TutorialModel implements TutorialModel {
  const factory _TutorialModel(
      {required final String videoLink,
      required final String title,
      final int rounds,
      required final String thumbnail}) = _$_TutorialModel;

  factory _TutorialModel.fromJson(Map<String, dynamic> json) =
      _$_TutorialModel.fromJson;

  @override
  String get videoLink;
  @override
  String get title;
  @override
  int get rounds;
  @override
  String get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_TutorialModelCopyWith<_$_TutorialModel> get copyWith =>
      throw _privateConstructorUsedError;
}
