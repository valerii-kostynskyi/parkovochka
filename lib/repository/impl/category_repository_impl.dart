import 'package:parkovochka/data/data_source/api_data_source.dart';
import 'package:parkovochka/data/model/category_model.dart';
import 'package:parkovochka/data/model/list_model.dart';
import 'package:parkovochka/data/model/subcategory_model.dart';
import 'package:parkovochka/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final ApiDataSource _apiDataSource;

  CategoryRepositoryImpl(this._apiDataSource);

  @override
  Future<ListModel<CategoryModel>> getCategories({required int offset}) {
    return _apiDataSource.getCategories(offset: offset);
  }

  @override
  Future<List<SubcategoryModel>> getSubcategories({
    required int categoryId,
  }) {
    return _apiDataSource.getSubcategories(categoryId: categoryId);
  }
}
