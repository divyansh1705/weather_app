import 'package:geolocator/geolocator.dart';

class Location{

    double? latitude;
    double? longitude;
    Future<void> checkPermissions() async {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          // Handle permission permanently denied scenario
          return;
        }
      }
    }
    Future<void> getCurrentLocation() async {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        return;
      }

      await checkPermissions();

      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100, // Minimum distance (in meters) before the location is updated
      );

      try {
        Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
        latitude=position.latitude;
        longitude=position.longitude;
      } catch (e) {
        print('Error retrieving location: $e');
      }
    }
  }
