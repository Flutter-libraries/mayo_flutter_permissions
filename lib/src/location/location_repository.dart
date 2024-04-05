import 'package:location/location.dart';
import 'package:mayo_flutter_permissions/mayo_flutter_permissions.dart';
import 'package:geolocator/geolocator.dart';

///
class LocationAccessFailure implements Exception {}

///
class LocationRepository {
  final PermissionsRepository _permissionsRepository = PermissionsRepository();

  ///
  Future<LocationData?> getLocation() async {
    try {
      if (await _permissionsRepository.isLocationPermissionsDenied()) {
        throw NotPermissionException();
      }

      // if (await _permissionsRepository.requestLocationPermissions()) {
      final location = await Location().getLocation();

      return location;
      // }
      // return null;
    } on NotPermissionException {
      rethrow;
    } catch (e) {
      throw LocationAccessFailure();
    }
  }

  /// Calculate distance between 2 points
  Future<double> calculateDistance(
    double lat1,
    double lng1,
    double lat2,
    double lng2,
  ) async {
    try {
      final distance = Geolocator.distanceBetween(lat1, lng1, lat2, lng2);

      return distance;
    } catch (e) {
      throw LocationAccessFailure();
    }
  }
}
