import 'package:parkovochka/data/model/coordinate_model.dart';
import 'package:parkovochka/util/json_extension.dart';

class ParkingModel {
  String id;
  String address;
  String googlePlaceId;
  CoordinateModel coordinate;

  ParkingModel({
    required this.id,
    required this.address,
    required this.coordinate,
    required this.googlePlaceId,
  });

  factory ParkingModel.fromJson(Map<String, dynamic> json) {
    return ParkingModel(
      id: json.parseJsonAsString(key: 'id'),
      address: json.parseJsonAsString(key: 'address'),
      googlePlaceId: json.parseJsonAsString(key: 'googlePlaceId'),
      coordinate: CoordinateModel.fromJson(json['coordinate']),
    );
  }
}
