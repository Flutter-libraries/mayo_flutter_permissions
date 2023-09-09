// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MediaState {
  String get localPathPhoto => throw _privateConstructorUsedError;
  String get localPathCamera => throw _privateConstructorUsedError;
  bool get isPhotoPermissionsDenied => throw _privateConstructorUsedError;
  bool get isCameraPermissionsDenied => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaStateCopyWith<MediaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaStateCopyWith<$Res> {
  factory $MediaStateCopyWith(
          MediaState value, $Res Function(MediaState) then) =
      _$MediaStateCopyWithImpl<$Res, MediaState>;
  @useResult
  $Res call(
      {String localPathPhoto,
      String localPathCamera,
      bool isPhotoPermissionsDenied,
      bool isCameraPermissionsDenied});
}

/// @nodoc
class _$MediaStateCopyWithImpl<$Res, $Val extends MediaState>
    implements $MediaStateCopyWith<$Res> {
  _$MediaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localPathPhoto = null,
    Object? localPathCamera = null,
    Object? isPhotoPermissionsDenied = null,
    Object? isCameraPermissionsDenied = null,
  }) {
    return _then(_value.copyWith(
      localPathPhoto: null == localPathPhoto
          ? _value.localPathPhoto
          : localPathPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      localPathCamera: null == localPathCamera
          ? _value.localPathCamera
          : localPathCamera // ignore: cast_nullable_to_non_nullable
              as String,
      isPhotoPermissionsDenied: null == isPhotoPermissionsDenied
          ? _value.isPhotoPermissionsDenied
          : isPhotoPermissionsDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      isCameraPermissionsDenied: null == isCameraPermissionsDenied
          ? _value.isCameraPermissionsDenied
          : isCameraPermissionsDenied // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaStateCopyWith<$Res>
    implements $MediaStateCopyWith<$Res> {
  factory _$$_MediaStateCopyWith(
          _$_MediaState value, $Res Function(_$_MediaState) then) =
      __$$_MediaStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String localPathPhoto,
      String localPathCamera,
      bool isPhotoPermissionsDenied,
      bool isCameraPermissionsDenied});
}

/// @nodoc
class __$$_MediaStateCopyWithImpl<$Res>
    extends _$MediaStateCopyWithImpl<$Res, _$_MediaState>
    implements _$$_MediaStateCopyWith<$Res> {
  __$$_MediaStateCopyWithImpl(
      _$_MediaState _value, $Res Function(_$_MediaState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localPathPhoto = null,
    Object? localPathCamera = null,
    Object? isPhotoPermissionsDenied = null,
    Object? isCameraPermissionsDenied = null,
  }) {
    return _then(_$_MediaState(
      localPathPhoto: null == localPathPhoto
          ? _value.localPathPhoto
          : localPathPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      localPathCamera: null == localPathCamera
          ? _value.localPathCamera
          : localPathCamera // ignore: cast_nullable_to_non_nullable
              as String,
      isPhotoPermissionsDenied: null == isPhotoPermissionsDenied
          ? _value.isPhotoPermissionsDenied
          : isPhotoPermissionsDenied // ignore: cast_nullable_to_non_nullable
              as bool,
      isCameraPermissionsDenied: null == isCameraPermissionsDenied
          ? _value.isCameraPermissionsDenied
          : isCameraPermissionsDenied // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MediaState extends _MediaState {
  const _$_MediaState(
      {this.localPathPhoto = '',
      this.localPathCamera = '',
      this.isPhotoPermissionsDenied = false,
      this.isCameraPermissionsDenied = false})
      : super._();

  @override
  @JsonKey()
  final String localPathPhoto;
  @override
  @JsonKey()
  final String localPathCamera;
  @override
  @JsonKey()
  final bool isPhotoPermissionsDenied;
  @override
  @JsonKey()
  final bool isCameraPermissionsDenied;

  @override
  String toString() {
    return 'MediaState(localPathPhoto: $localPathPhoto, localPathCamera: $localPathCamera, isPhotoPermissionsDenied: $isPhotoPermissionsDenied, isCameraPermissionsDenied: $isCameraPermissionsDenied)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaState &&
            (identical(other.localPathPhoto, localPathPhoto) ||
                other.localPathPhoto == localPathPhoto) &&
            (identical(other.localPathCamera, localPathCamera) ||
                other.localPathCamera == localPathCamera) &&
            (identical(
                    other.isPhotoPermissionsDenied, isPhotoPermissionsDenied) ||
                other.isPhotoPermissionsDenied == isPhotoPermissionsDenied) &&
            (identical(other.isCameraPermissionsDenied,
                    isCameraPermissionsDenied) ||
                other.isCameraPermissionsDenied == isCameraPermissionsDenied));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localPathPhoto, localPathCamera,
      isPhotoPermissionsDenied, isCameraPermissionsDenied);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaStateCopyWith<_$_MediaState> get copyWith =>
      __$$_MediaStateCopyWithImpl<_$_MediaState>(this, _$identity);
}

abstract class _MediaState extends MediaState {
  const factory _MediaState(
      {final String localPathPhoto,
      final String localPathCamera,
      final bool isPhotoPermissionsDenied,
      final bool isCameraPermissionsDenied}) = _$_MediaState;
  const _MediaState._() : super._();

  @override
  String get localPathPhoto;
  @override
  String get localPathCamera;
  @override
  bool get isPhotoPermissionsDenied;
  @override
  bool get isCameraPermissionsDenied;
  @override
  @JsonKey(ignore: true)
  _$$_MediaStateCopyWith<_$_MediaState> get copyWith =>
      throw _privateConstructorUsedError;
}
