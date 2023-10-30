import 'package:permission_handler/permission_handler.dart';

/// Repository to handle permissions
class PermissionsRepository {
  /// Open the settings of the app
  Future<void> openSettings() async {
    await openAppSettings();
  }

  /// PHOTOS AND CAMERA
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
  /// Check if the user has the permission to access the camera
  Future<bool> isStorageStatusDenied() async {
    final status = await Permission.storage.status;

    return status.isPermanentlyDenied;
  }

  /// Request the permission to access the camera
  Future<bool> requestPhotoPermissions() async {
    final status = await Permission.photos.request();
    return status.isGranted;
  }

  /// Request the permission to access the camera
  Future<bool> requestCameraPermissions() async {
    return (await Permission.camera.request()).isGranted;
  }
  /// Request the permission to access the camera
  Future<bool> requestStoragePermissions() async {
    return (await Permission.storage.request()).isGranted;
  }

  /// LOCATION

  /// Check if the user has the permission to access the location
  Future<bool> isLocationPermissionsDenied() async {
    final status = await Permission.location.status;

    return status.isPermanentlyDenied;
  }

  /// Request the permission to access the location
  Future<bool> requestLocationPermissions() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  /// NOTIFICATIONS

  /// Check if the user has the permission to access the notifications
  Future<bool> isNotificationPermissionsDenied() async {
    final status = await Permission.notification.status;

    return status.isPermanentlyDenied;
  }

  /// Request the permission to access the notifications
  Future<bool> requestNotificationPermissions() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }
}
