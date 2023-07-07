import 'package:parkovochka/data/model/google_place_model.dart';

abstract class ApiDataSource {
  Future<String> getPlaceIdFromLatLng({
    required double lat,
    required double lng,
  });

  Future<GooglePlaceModel> getLocationDetails({
    required String placeId,
  });
}
