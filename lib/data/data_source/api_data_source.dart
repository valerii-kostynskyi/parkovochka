import 'package:parkovochka/data/model/google_place_model.dart';
import 'package:parkovochka/data/model/parking_model.dart';
import 'package:parkovochka/data/model/response/capacity_respone.dart';
import 'package:parkovochka/data/model/response/traffic_respone.dart';

abstract class ApiDataSource {
  Future<String> getPlaceIdFromLatLng({
    required double lat,
    required double lng,
  });

  Future<GooglePlaceModel> getLocationDetails({
    required String placeId,
  });

  Future<List<ParkingModel>> getParkingList();

  Future<bool> postParking({required GooglePlaceModel googlePlace});

    Future<List<CapacityResponse>> getCapacity();

  Future<List<TrafficResponse>> getTraffic();
}
