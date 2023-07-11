import 'package:geolocator/geolocator.dart';
import 'package:parkovochka/data/data_source/api_data_source.dart';
import 'package:parkovochka/data/model/google_place_model.dart';
import 'package:parkovochka/domain/geolocation_repository.dart';

class GeolocationRepositoryImpl implements GeolocationRepository {
  final ApiDataSource _apiDataSource;

  GeolocationRepositoryImpl(this._apiDataSource);

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

  @override
  Future<String> getPlaceIdFromLatLng({
    required double lat,
    required double lng,
  }) {
    return _apiDataSource.getPlaceIdFromLatLng(lat: lat, lng: lng);
  }

  @override
  Future<GooglePlaceModel> getLocationDetails({
    required String placeId,
  }) {
    return _apiDataSource.getLocationDetails(placeId: placeId);
  }
}
