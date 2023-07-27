import 'package:parkovochka/util/json_extension.dart';

class CapacityResponse {
  final String value;
  final String name;
  CapacityResponse({
    required this.value,
    required this.name,
  });

  factory CapacityResponse.fromJson(Map json) => CapacityResponse(
        value: json.parseJsonAsString(key: 'value'),
        name: json.parseJsonAsString(key: 'name'),
      );
}
