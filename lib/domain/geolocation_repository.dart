import 'package:geolocator/geolocator.dart';
import 'package:parkovochka/data/model/google_place_model.dart';

abstract class GeolocationRepository {
  Future<Position?> getCurrentPosition();

  Future<String> getPlaceIdFromLatLng({
    required double lat,
    required double lng,
  });

  Future<GooglePlaceModel> getLocationDetails({
    required String placeId,
  });
}
