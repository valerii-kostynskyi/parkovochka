import 'package:parkovochka/data/model/parking_model.dart';

abstract class ParkingRepository {
  Future<List<ParkingModel>> getParkingList();
}
