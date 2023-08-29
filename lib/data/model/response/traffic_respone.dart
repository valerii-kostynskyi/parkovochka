import 'package:parkovochka/util/json_extension.dart';

class TrafficResponse {
  final String value;
  final String name;
  TrafficResponse({
    required this.value,
    required this.name,
  });

  factory TrafficResponse.fromJson(Map json) => TrafficResponse(
        value: json.parseJsonAsString(key: 'value'),
        name: json.parseJsonAsString(key: 'name'),
      );
}
