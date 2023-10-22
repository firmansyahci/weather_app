import 'package:dio/dio.dart';

import '../consts/api_path.dart';
import '../models/forecast.dart';
import '../services/dio_client.dart';
import '../services/dio_exceptions.dart';

class WeatherRepository {
  final DioClient _dioClient = DioClient.instance;

  Future<Forecast> getForecast({double? lat, double? long}) async {
    try {
      final response = await _dioClient.get(path: ApiPath.forecast(lat, long));
      return Forecast.fromJson(response);
    } on DioException catch (e) {
      var error = DioExceptions.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
