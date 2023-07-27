import 'package:parkovochka/util/json_extension.dart';

class CapacityResponse {
  final String value;
  final String display;
  CapacityResponse({
    required this.value,
    required this.display,
  });

  factory CapacityResponse.fromJson(Map json) => CapacityResponse(
        value: json.parseJsonAsString(key: 'value'),
        display: json.parseJsonAsString(key: 'display'),
      );
}
