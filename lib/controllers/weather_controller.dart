import 'dart:developer';

import 'package:get/get.dart';
import 'package:location/location.dart';

import '../data/models/forecast.dart';
import '../data/repositories/weather_repository.dart';
import '../route/named_route.dart';

class WeatherContoller extends GetxController {
  final WeatherRepository _weatherRepository = WeatherRepository();

  Forecast? forecast;

  RxBool isLoading = false.obs;

  Location? location = Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  @override
  void onInit() {
    super.onInit();

    getForecast();
  }

  goToWeatherDetailScreen(WeatherElement? weather) {
    Get.toNamed(NamedRoute.weathetDetail, arguments: weather);
  }

  getForecast() async {
    try {
      setIsLoading(true);

      await getLocation();
      forecast = await _weatherRepository.getForecast(
          lat: _locationData?.latitude, long: _locationData?.longitude);

      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      log(e.toString());
    }
  }

  getLocation() async {
    _serviceEnabled = await location?.serviceEnabled();
    if (!(_serviceEnabled ?? false)) {
      _serviceEnabled = await location?.requestService();
      if (!(_serviceEnabled ?? false)) {
        return;
      }
    }

    _permissionGranted = await location?.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location?.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location?.getLocation();
  }

  setIsLoading(bool value) {
    isLoading.value = value;
    update();
  }
}
