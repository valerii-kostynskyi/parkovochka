import 'dart:async';

import 'package:parkovochka/data/data_source/api_data_source.dart';
import 'package:parkovochka/data/model/parking_model.dart';
import 'package:parkovochka/data/model/request/parking_request.dart';
import 'package:parkovochka/data/model/response/traffic_respone.dart';
import 'package:parkovochka/data/model/response/capacity_respone.dart';
import 'package:parkovochka/domain/parking_repository.dart';

class ParkingRepositoryImpl implements ParkingRepository {
  final ApiDataSource apiDataSource;
  final _parkingPostedController = StreamController<void>.broadcast();
  ParkingRepositoryImpl(this.apiDataSource);

  @override
  Stream<void> get parkingPostedStream => _parkingPostedController.stream;

  void dispose() {
    _parkingPostedController.close();
  }

  @override
  Future<List<ParkingModel>> getParkingList() {
    return apiDataSource.getParkingList();
  }

  @override
  Future<bool> postParking({required ParkingRequest parking}) {
    _parkingPostedController.add(null);
    return apiDataSource.postParking(parking: parking);
  }

  @override
  Future<List<TrafficResponse>> getTraffic() {
    return apiDataSource.getTraffic();
  }

  @override
  Future<List<CapacityResponse>> getCapacity() {
    return apiDataSource.getCapacity();
  }
}
