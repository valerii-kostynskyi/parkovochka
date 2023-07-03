import 'package:equatable/equatable.dart';

import 'package:bloc_exempl/util/json_extension.dart';

class SubcategoryModel extends Equatable {
  final int id;
  final String name;
  final int category;

  const SubcategoryModel({
    required this.id,
    required this.name,
    required this.category,
  });

  factory SubcategoryModel.fromJson(Map json) => SubcategoryModel(
        id: json.parseJsonAsInt(key: 'id'),
        name: json.parseJsonAsString(key: 'name'),
        category: json.parseJsonAsInt(key: 'category'),
      );

  @override
  List<Object> get props => [id, name, category];
}
