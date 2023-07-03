import 'package:bloc_exempl/data/model/category_model.dart';
import 'package:bloc_exempl/data/model/list_model.dart';

class CategoryListResponse extends ListModel<CategoryModel> {
  CategoryListResponse.fromJson(Map json) : super.fromJson(json);

  @override
  CategoryModel fromJson(Map json) => CategoryModel.fromJson(json);
}
