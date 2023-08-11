import 'package:parkovochka/data/model/parking_model.dart';
import 'package:parkovochka/data/model/request/parking_request.dart';
import 'package:parkovochka/data/model/response/capacity_respone.dart';
import 'package:parkovochka/data/model/response/traffic_respone.dart';

abstract class ParkingRepository {
  Future<List<ParkingModel>> getParkingList();

  Future<bool> postParking({
    required ParkingRequest parking,
  });

  Future<List<CapacityResponse>> getCapacity();

  Future<List<TrafficResponse>> getTraffic();

  Stream<void> get parkingPostedStream; 
}
