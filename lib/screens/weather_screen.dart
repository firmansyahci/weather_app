import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/weather_controller.dart';
import '../widgets/weather_item.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherContoller weatherContoller = Get.put(WeatherContoller());

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: false,
      ),
      body: Obx(
        () => weatherContoller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: weatherContoller.forecast?.list?.length ?? 0,
                itemBuilder: (ctx, i) => InkWell(
                  onTap: () => weatherContoller.goToWeatherDetailScreen(
                      weatherContoller.forecast?.list?[i]),
                  child: WeatherItem(
                    dateTime: weatherContoller.forecast?.list?[i].dtTxt,
                    weather:
                        weatherContoller.forecast?.list?[i].weather?.first.main,
                    temp: weatherContoller.forecast?.list?[i].main?.temp,
                    icon:
                        weatherContoller.forecast?.list?[i].weather?.first.icon,
                  ),
                ),
                separatorBuilder: (ctx, i) => const Divider(),
              ),
      ),
    );
  }
}
