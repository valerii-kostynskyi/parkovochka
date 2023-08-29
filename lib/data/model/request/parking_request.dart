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

  ParkingRequest.withDefaultValues()
      : address = '',
        googlePlaceId = '',
        coordinate = CoordinateModel(latitude: 0.0, longitude: 0.0),
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
        'description': description,
        'photoId': photoId,
      };

  bool isValid() {
    return address.isNotEmpty &&
        googlePlaceId.isNotEmpty &&
        (capacity == 'value_1' ||
            capacity == 'value_6' ||
            capacity == 'value_10') &&
        (traffic == 'low' || traffic == 'medium' || traffic == 'large') &&
        (userRating >= 1 && userRating <= 10) &&
        (coordinate.latitude != 0.0 && coordinate.longitude != 0.0);
  }
}
