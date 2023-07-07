import 'dart:convert';

import 'package:parkovochka/const.dart';
import 'package:parkovochka/data/data_source/api_data_source.dart';
import 'package:parkovochka/data/model/google_place_model.dart';
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
        settings: const TalkerDioLoggerSettings(printResponseData: false),
      ),
    );
  }





  @override
  Future<GooglePlaceModel> getLocationDetails({
    required double lat,
    required double lng,
  }) async {
    final Map<String, dynamic> query = {
      'key': googleApiKeyIos,
      'place_id': '$lat,$lng',
    };
    Response response = await dio.get(
      basePlacesURL,
      queryParameters: query,
    );

    return GooglePlaceModel.fromJson(jsonDecode(response.data));
  }
}
