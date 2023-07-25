import 'package:parkovochka/data/model/google_place_model.dart';
import 'package:parkovochka/data/model/parking_model.dart';

abstract class ParkingRepository {
  Future<List<ParkingModel>> getParkingList();

  Future<bool> postParking({
    required GooglePlaceModel googlePlace,
  });
}
