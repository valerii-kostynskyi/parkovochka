import 'package:parkovochka/data/data_source/api_data_source.dart';
import 'package:parkovochka/data/model/parking_model.dart';
import 'package:parkovochka/domain/parking_repository.dart';

class ParkingRepositoryImpl implements ParkingRepository {
  final ApiDataSource apiDataSource;
  ParkingRepositoryImpl(this.apiDataSource);

  @override
  Future<List<ParkingModel>> getParkingList() {
    return apiDataSource.getParkingList();
  }
}
