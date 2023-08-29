class EnumModel {
  final Map<String, String> value;
  EnumModel({
    required this.value,
  });

  factory EnumModel.fromJson(Map json) => EnumModel(
        value: json[0],
      );
}
