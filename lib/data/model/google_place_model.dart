import 'package:parkovochka/util/json_extension.dart';

class GooglePlaceModel {
  String region;
  String locality;
  String route;
  String streetNumber;
  String address;
  double lng;
  double lat;
  GooglePlaceModel({
    required this.region,
    required this.locality,
    required this.route,
    required this.streetNumber,
    required this.address,
    required this.lng,
    required this.lat,
  });

//TODO change keys
  factory GooglePlaceModel.fromJson(Map json) => GooglePlaceModel(
        region: json.parseJsonAsString(key: 'access_token'),
        locality: json.parseJsonAsString(key: 'refresh_token'),
        route: json.parseJsonAsString(key: 'refresh_token'),
        streetNumber: json.parseJsonAsString(key: 'refresh_token'),
        address: json.parseJsonAsString(key: 'refresh_token'),
        lng: json.parseJsonAsDouble(key: 'refresh_token'),
        lat: json.parseJsonAsDouble(key: 'refresh_token'),
      );
}
