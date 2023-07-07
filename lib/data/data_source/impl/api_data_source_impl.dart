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
  Future<String> getPlaceIdFromLatLng({
    required double lat,
    required double lng,
  }) async {
    final Map<String, dynamic> query = {
      'latlng': '$lat,$lng',
      'key': googleApiKeyIos,
      'result_type': 'point_of_interest',
    };

    Response response = await dio.get(
      geocodingURL,
      queryParameters: query,
    );

    if (response.statusCode == 200) {
      final data = response.data;
      if (data['status'] == 'OK') {
        final results = data['results'];
        if (results.isNotEmpty) {
          final firstResult = results[0];
          final placeId = firstResult['place_id'];
          return placeId;
        }
      }
    }

    throw Exception('Failed to retrieve place ID from LatLng.');
  }

  @override
  Future<GooglePlaceModel> getLocationDetails({
    required String placeId,
  }) async {
    final Map<String, dynamic> query = {
      'key': googleApiKeyIos,
      'place_id': placeId,
    };
    Response response = await dio.get(
      basePlacesURL,
      queryParameters: query,
    );

    return GooglePlaceModel.fromJson(response.data['result']);
  }
}
