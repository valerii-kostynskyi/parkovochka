import 'package:parkovochka/data/data_source/api_data_source.dart';
import 'package:parkovochka/data/model/google_place_model.dart';
import 'package:parkovochka/data/model/parking_model.dart';
import 'package:parkovochka/data/model/response/traffic_respone.dart';
import 'package:parkovochka/data/model/response/capacity_respone.dart';
import 'package:parkovochka/domain/parking_repository.dart';

class ParkingRepositoryImpl implements ParkingRepository {
  final ApiDataSource apiDataSource;
  ParkingRepositoryImpl(this.apiDataSource);

  @override
  Future<List<ParkingModel>> getParkingList() {
    return apiDataSource.getParkingList();
  }

  @override
  Future<bool> postParking({required GooglePlaceModel googlePlace}) {
    return apiDataSource.postParking(googlePlace: googlePlace);
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
