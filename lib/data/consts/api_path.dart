import 'package:weather_app/config/app_config.dart';

class ApiPath {
  static String forecast(double? lat, double? long) =>
      '/forecast?lat=$lat&lon=$long&appid=${AppConfig.apiKey}';
}
