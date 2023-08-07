import 'package:parkovochka/data/model/coordinate_model.dart';
import 'package:parkovochka/data/model/google_place_model.dart';

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

  ParkingRequest.fromGooglePlaceModel(GooglePlaceModel googlePlace)
      : address = googlePlace.address,
        googlePlaceId = googlePlace.googlePlaceId,
        coordinate = googlePlace.coordinate,
        capacity = 'value_1',
        traffic = 'low',
        photoId = null,
        description = null,
        security = true,
        light = true,
        weatherProtection = true,
        userRating = 5;

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
