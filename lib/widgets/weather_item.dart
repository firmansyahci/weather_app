import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../utils/app_utils.dart';

class WeatherItem extends StatelessWidget {
  final DateTime? dateTime;
  final String? weather;
  final double? temp;
  final String? icon;

  const WeatherItem(
      {this.dateTime, this.weather, this.temp, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (icon != null)
            Image.network(
              AppConfig.getIconUrl(icon!),
              width: 48,
              height: 48,
            ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppUtils.translateDateTime(dateTime),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  weather ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  AppUtils.translateTempCelcius(temp),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
