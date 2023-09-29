import 'package:location/location.dart';
import 'package:mayo_flutter_permissions/mayo_flutter_permissions.dart';

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
}
