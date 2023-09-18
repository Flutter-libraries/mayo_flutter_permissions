import 'package:permission_handler/permission_handler.dart';

/// Repository to handle permissions
class PermissionsRepository {
  /// Check if the user has the permission to access the photos
  Future<bool> isPhotosPermissionsDenied() async {
    final status = await Permission.photos.status;

    return status.isPermanentlyDenied;
  }

  /// Check if the user has the permission to access the camera
  Future<bool> isCameraPermissionsDenied() async {
    final status = await Permission.camera.status;

    return status.isPermanentlyDenied;
  }

  /// Request the permission to access the camera
  Future<bool> requestGalleryPermissions() async {
    final status = await Permission.photos.request();
    return status.isGranted;
  }

  /// Request the permission to access the camera
  Future<bool> requestCameraPermissions() async {
    return (await Permission.camera.request()).isGranted;
  }

  /// Open the settings of the app
  Future<void> openSettings() async {
    await openAppSettings();
  }
}
