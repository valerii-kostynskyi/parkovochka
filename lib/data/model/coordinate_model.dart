class CoordinateModel {
  double latitude;
  double longitude;

  CoordinateModel({
    required this.latitude,
    required this.longitude,
  });

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
      latitude: json['lat'] ?? json['latitude'],
      longitude: json['lng'] ?? json['longitude'],
    );
  }
}
