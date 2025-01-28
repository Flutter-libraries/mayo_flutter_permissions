import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mayo_flutter_permissions/mayo_flutter_permissions.dart';

class NotPermissionException implements Exception {}

class MediaPickerFailure implements Exception {}

enum SourceMediaType { image, video, all }

class MediaPickerConf {
  MediaPickerConf({required this.type, this.multiple = false});

  final SourceMediaType type;
  final bool multiple;
}

class MediaPickerRepository {
  final PermissionsRepository _permissionsRepository = PermissionsRepository();
  final picker = ImagePicker();

  Future<XFile?> justPickMediaFromGallery(MediaPickerConf conf) async {
    try {
      if (conf.type == SourceMediaType.image) {
        final value = await picker.pickImage(source: ImageSource.gallery);

        return value;
      } else if (conf.type == SourceMediaType.video) {
        final value = await picker.pickVideo(source: ImageSource.gallery);

        return value;
      } else {
        final value = await picker.pickMedia();

        return value;
      }
    } on NotPermissionException {
      rethrow;
    } catch (e) {
      throw MediaPickerFailure();
    }
  }

  Future<XFile?> justPickMediaFromCamera(MediaPickerConf conf) async {
    try {
      if (conf.type == SourceMediaType.image) {
        final value = await picker.pickImage(source: ImageSource.camera);

        return value;
      } else if (conf.type == SourceMediaType.video) {
        final value = await picker.pickVideo(source: ImageSource.camera);

        return value;
      } else {
        final value = await picker.pickMedia();

        return value;
      }
    } on NotPermissionException {
      rethrow;
    } catch (e) {
      throw MediaPickerFailure();
    }
  }

  Future<XFile?> pickMediaFromGallery(MediaPickerConf conf) async {
    try {
      var requestPhotosPermissions = true;

      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt <= 32) {
          requestPhotosPermissions = false;
        } else {
          requestPhotosPermissions = true;
        }
      }

      if (requestPhotosPermissions &&
              await _permissionsRepository.isPhotosPermissionsDenied() ||
          !requestPhotosPermissions &&
              await _permissionsRepository.isStorageStatusDenied()) {
        throw NotPermissionException();
      }

      if (requestPhotosPermissions &&
              await _permissionsRepository.requestPhotoPermissions() ||
          !requestPhotosPermissions &&
              await _permissionsRepository.requestStoragePermissions()) {
        if (conf.type == SourceMediaType.image) {
          final value = await picker.pickImage(source: ImageSource.gallery);

          return value;
        } else if (conf.type == SourceMediaType.video) {
          final value = await picker.pickVideo(source: ImageSource.gallery);

          return value;
        } else {
          final value = await picker.pickMedia();

          return value;
        }
      } else {
        return null;
      }
    } on NotPermissionException {
      rethrow;
    } catch (e) {
      throw MediaPickerFailure();
    }
  }

  Future<XFile?> pickMediaFromCamera(MediaPickerConf conf) async {
    try {
      if (await _permissionsRepository.isCameraPermissionsDenied()) {
        throw NotPermissionException();
      }

      if (await _permissionsRepository.requestCameraPermissions()) {
        if (conf.type == SourceMediaType.image) {
          final value = await picker.pickImage(source: ImageSource.camera);

          return value;
        } else if (conf.type == SourceMediaType.video) {
          final value = await picker.pickVideo(source: ImageSource.camera);

          return value;
        } else {
          final value = await picker.pickMedia();

          return value;
        }
      } else {
        return null;
      }
    } on NotPermissionException {
      rethrow;
    } catch (e) {
      throw MediaPickerFailure();
    }
  }

  ///
  Future<XFile?> pickFile(
      {List<String>? allowedExtensions, bool anyType = false}) async {
    try {
      if (await _permissionsRepository.isStorageStatusDenied()) {
        throw NotPermissionException();
      }

      if (await _permissionsRepository.requestStoragePermissions()) {
        final value = await FilePicker.platform.pickFiles(
          allowedExtensions: anyType ? null : allowedExtensions,
          type: anyType ? FileType.any : FileType.custom,
        );
        if (value != null) {
          return XFile(
            value.files.single.path!,
            name: value.files.single.name,
            length: value.files.single.size,
            mimeType: value.files.single.extension,
            bytes: value.files.single.bytes,
          );
        }
      }
      return null;
    } on NotPermissionException {
      rethrow;
    } catch (e) {
      throw MediaPickerFailure();
    }
  }
}
