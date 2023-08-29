import 'package:parkovochka/data/model/coordinate_model.dart';
import 'package:parkovochka/util/json_extension.dart';

class ParkingModel {
  String id;
  String address;
  String googlePlaceId;
  String capacity;
  String traffic;
  String photoId;
  String description;
  bool security;
  bool light;
  bool weatherProtection;
  int userRating;
  CoordinateModel coordinate;

  ParkingModel({
    required this.id,
    required this.address,
    required this.googlePlaceId,
    required this.capacity,
    required this.traffic,
    required this.photoId,
    required this.description,
    required this.security,
    required this.light,
    required this.weatherProtection,
    required this.userRating,
    required this.coordinate,
  });

  factory ParkingModel.fromJson(Map<String, dynamic> json) {
    return ParkingModel(
      id: json.parseJsonAsString(key: 'id'),
      address: json.parseJsonAsString(key: 'address'),
      googlePlaceId: json.parseJsonAsString(key: 'googlePlaceId'),
      coordinate: CoordinateModel.fromJson(json['coordinate']),
      capacity: json.parseJsonAsString(key: 'capacity'),
      description: json.parseJsonAsString(key: 'description'),
      light: json.parseJsonAsBool(key: 'light'),
      photoId: json.parseJsonAsString(key: 'photoId'),
      security: json.parseJsonAsBool(key: 'security'),
      traffic: json.parseJsonAsString(key: 'traffic'),
      userRating: json.parseJsonAsInt(key: 'photoId'),
      weatherProtection: json.parseJsonAsBool(key: 'weatherProtection'),
    );
  }
}
