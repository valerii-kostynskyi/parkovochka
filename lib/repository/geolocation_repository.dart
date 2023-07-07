import 'package:geolocator/geolocator.dart';
import 'package:parkovochka/data/model/google_place_model.dart';

abstract class GeolocationRepository {
  Future<Position?> getCurrentPosition();
    Future<GooglePlaceModel> getLocationDetails({
    required double lat,
    required double lng,
  });
}
