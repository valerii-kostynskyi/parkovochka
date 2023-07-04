import 'package:parkovochka/data/model/category_model.dart';
import 'package:parkovochka/data/model/list_model.dart';

class CategoryListResponse extends ListModel<CategoryModel> {
  CategoryListResponse.fromJson(Map json) : super.fromJson(json);

  @override
  CategoryModel fromJson(Map json) => CategoryModel.fromJson(json);
}
