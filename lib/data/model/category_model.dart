// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:parkovochka/data/model/subcategory_model.dart';
import 'package:parkovochka/util/json_extension.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String icon;
  final List<SubcategoryModel> subcategoryList;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.subcategoryList,
  });

  factory CategoryModel.fromJson(Map json) => CategoryModel(
        id: json.parseJsonAsInt(key: 'id'),
        icon: json.parseJsonAsString(key: 'icon'),
        name: json.parseJsonAsString(key: 'name'),
        subcategoryList:
            json['subcategories'] != null && json['subcategories'] is Iterable
                ? (json['subcategories'] as Iterable)
                    .map((e) => SubcategoryModel.fromJson(e))
                    .toList()
                : [],
      );

  @override
  List<Object> get props => [id, name, icon, subcategoryList];
}
