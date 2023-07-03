import 'package:bloc_exempl/data/model/category_model.dart';
import 'package:bloc_exempl/data/model/list_model.dart';
import 'package:bloc_exempl/data/model/subcategory_model.dart';

abstract class ApiDataSource {
  Future<ListModel<CategoryModel>> getCategories({required int offset});

  Future<List<SubcategoryModel>> getSubcategories({
    required int categoryId,
  });
}
