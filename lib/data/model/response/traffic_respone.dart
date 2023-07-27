import 'package:parkovochka/util/json_extension.dart';

class TrafficResponse {
  final String value;
  final String display;
  TrafficResponse({
    required this.value,
    required this.display,
  });

  factory TrafficResponse.fromJson(Map json) => TrafficResponse(
        value: json.parseJsonAsString(key: 'value'),
        display: json.parseJsonAsString(key: 'display'),
      );
}
