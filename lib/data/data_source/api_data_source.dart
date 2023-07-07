import 'package:parkovochka/data/model/google_place_model.dart';

abstract class ApiDataSource {

  Future<GooglePlaceModel> getLocationDetails({
    required double lat,
    required double lng,
  });
}
