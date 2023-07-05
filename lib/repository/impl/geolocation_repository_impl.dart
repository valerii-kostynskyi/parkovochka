import 'package:geolocator/geolocator.dart';
import 'package:parkovochka/repository/geolocation_repository.dart';

class GeolocationRepositoryImpl implements GeolocationRepository {
  GeolocationRepositoryImpl();
  @override
  Future<Position?> getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
