import 'package:get/get.dart';

import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/verify_screen.dart';
import '../screens/weather_detail_screen.dart';
import '../screens/weather_screen.dart';
import 'named_route.dart';

class AppRoute {
  static final List<GetPage> all = [
    GetPage(
      name: NamedRoute.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: NamedRoute.register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: NamedRoute.verify,
      page: () => VerifyScreen(),
    ),
    GetPage(
      name: NamedRoute.weather,
      page: () => WeatherScreen(),
    ),
    GetPage(
      name: NamedRoute.weathetDetail,
      page: () => WeatherDetailScreen(),
    ),
  ];
}
