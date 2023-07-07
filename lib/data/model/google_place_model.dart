class GooglePlaceModel {
  String formattedAddress;
  String placeId;
  Map<String, double> geometry;

  GooglePlaceModel({
    required this.formattedAddress,
    required this.geometry,
    required this.placeId,
  });

  factory GooglePlaceModel.fromJson(Map<String, dynamic> json) {
    return GooglePlaceModel(
      formattedAddress: json['formatted_address'],
      placeId: json['place_id'],
      geometry: {
        'lat': json['geometry']['location']['lat'],
        'lng': json['geometry']['location']['lng'],
      },
    );
  }
}
