import 'package:parkovochka/data/data_source/api_data_source.dart';
import 'package:parkovochka/data/model/list_model.dart';
import 'package:parkovochka/data/model/response/category_list_response.dart';
import 'package:parkovochka/data/model/subcategory_model.dart';
import 'package:parkovochka/data/model/category_model.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ApiDataSourceImpl implements ApiDataSource {
  final dio = Dio();
  Talker talker;

  ApiDataSourceImpl({required this.talker}) {
    dio.interceptors.add(
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          //show all data
          printResponseData: false,
        ),
      ),
    );
  }

  @override
  Future<ListModel<CategoryModel>> getCategories({required int offset}) async {
    final Map<String, dynamic> query = {};
    query['limit'] = 10.toString();
    query['offset'] = offset.toString();
    final response = await dio.get(
      'http://18.156.192.87/api/categories/',
      queryParameters: query,
    );

    return CategoryListResponse.fromJson(response.data);
  }

  @override
  Future<List<SubcategoryModel>> getSubcategories({required int categoryId}) {
    // TODO: implement getSubcategories
    throw UnimplementedError();
  }
}
