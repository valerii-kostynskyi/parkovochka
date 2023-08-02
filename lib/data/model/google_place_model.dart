import 'package:parkovochka/data/model/coordinate_model.dart';
import 'package:parkovochka/util/json_extension.dart';

class GooglePlaceModel {
  String address;
  String googlePlaceId;
  CoordinateModel coordinate;

  GooglePlaceModel({
    required this.address,
    required this.coordinate,
    required this.googlePlaceId,
  });

  factory GooglePlaceModel.fromJson(Map<String, dynamic> json) {
    return GooglePlaceModel(
      address: json.parseJsonAsString(key: 'formatted_address'),
      googlePlaceId: json.parseJsonAsString(key: 'place_id'),
      coordinate: CoordinateModel.fromJson(json['geometry']['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'coordinate': coordinate.toJson(),
      'googlePlaceId': googlePlaceId,
    };
  }
}
