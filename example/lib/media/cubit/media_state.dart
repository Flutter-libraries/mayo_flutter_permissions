part of 'media_cubit.dart';

@freezed
class MediaState with _$MediaState {
  const factory MediaState({
    @Default('') String localPathPhoto,
    @Default('') String localPathCamera,
    @Default(false) bool isPhotoPermissionsDenied,
    @Default(false) bool isCameraPermissionsDenied,
  }) = _MediaState;
  const MediaState._();

  
}
