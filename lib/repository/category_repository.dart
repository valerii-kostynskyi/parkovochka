import 'package:parkovochka/data/model/category_model.dart';
import 'package:parkovochka/data/model/list_model.dart';
import 'package:parkovochka/data/model/subcategory_model.dart';

abstract class CategoryRepository {
  Future<ListModel<CategoryModel>> getCategories({required int offset});

  Future<List<SubcategoryModel>> getSubcategories({
    required int categoryId,
  });
}
