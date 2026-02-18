import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static Future<Position?> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      var serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('📍 Location services are disabled');
        return null;
      }

      // Check permission
      PermissionStatus permission = await Permission.location.status;
      
      if (permission.isDenied) {
        permission = await Permission.location.request();
        if (permission.isDenied) {
          print('📍 Location permission denied');
          return null;
        }
      }

      if (permission.isPermanentlyDenied) {
        print('📍 Location permission permanently denied');
        return null;
      }

      // Get current position
      var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      print('📍 Current location: ${position.latitude}, ${position.longitude}');
      return position;
    } catch (e) {
      print('❌ Error getting location: $e');
      return null;
    }
  }

  static double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2) / 1000; // in km
  }

  static String formatDistance(double distanceInKm) {
    if (distanceInKm < 1) {
      return '${(distanceInKm * 1000).toStringAsFixed(0)}m away';
    } else if (distanceInKm < 10) {
      return '${distanceInKm.toStringAsFixed(1)}km away';
    } else {
      return '${distanceInKm.toStringAsFixed(0)}km away';
    }
  }

  static Future<bool> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    return status.isGranted;
  }
}
