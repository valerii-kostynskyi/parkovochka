import 'package:parkovochka/const.dart';
import 'package:parkovochka/data/data_source/api_data_source.dart';
import 'package:parkovochka/data/model/google_place_model.dart';
import 'package:dio/dio.dart';
import 'package:parkovochka/data/model/parking_model.dart';
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
        settings: const TalkerDioLoggerSettings(printResponseData: true),
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
      if (data['status'] == 'ZERO_RESULTS') {
        final plusCodeGlobal = data['plus_code']['global_code'];

        final Map<String, dynamic> queryPlusCode = {
          'address': plusCodeGlobal,
          'key': googleApiKeyIos,
        };

        Response responsePlusCode = await dio.get(
          geocodingURL,
          queryParameters: queryPlusCode,
        );

        if (responsePlusCode.statusCode == 200) {
          final dataPlusCode = responsePlusCode.data;
          if (dataPlusCode['status'] == 'OK') {
            final resultsPlusCode = dataPlusCode['results'];
            if (resultsPlusCode.isNotEmpty) {
              final firstResultPlusCode = resultsPlusCode[0];
              final placeIdPlusCode = firstResultPlusCode['place_id'];
              return placeIdPlusCode;
            }
          }
        }
      }
    }
    return '';
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

  @override
  Future<List<ParkingModel>> getParkingList() async {
    final Response response = await dio.get('$apiUrl/parkings');

    if (response.statusCode == 200) {
      List<dynamic> mapList = response.data;

      List<ParkingModel> parkingList = mapList
          .cast<Map<String, dynamic>>()
          .map((map) => ParkingModel.fromJson(map))
          .toList();
      return parkingList;
    }
//TODO throw error
    return [];
  }
}
