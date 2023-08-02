import 'package:parkovochka/data/model/coordinate_model.dart';

class ParkingRequest {
  String address;
  String googlePlaceId;
  CoordinateModel coordinate;
  String capacity;
  String traffic;
  String? photoId;
  String? description;
  bool security;
  bool light;
  bool weatherProtection;
  int userRating;

  ParkingRequest({
    required this.address,
    required this.googlePlaceId,
    required this.coordinate,
    required this.capacity,
    required this.traffic,
    this.photoId,
    this.description,
    required this.security,
    required this.light,
    required this.weatherProtection,
    required this.userRating,
  });

  Map toJson() => {
        'address': address,
        'googlePlaceId': googlePlaceId,
        'capacity': capacity,
        'coordinate': coordinate.toJson(),
        'security': security,
        'light': light,
        'traffic': traffic,
        'weatherProtection': weatherProtection,
        'userRating': userRating,
        // 'description': description,
        // 'photoId': photoId,
      };
}
