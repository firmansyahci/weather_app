class AppConfig {
  static const String apiKey = ''; // type your open weather api key
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static String getIconUrl(String icon) =>
      'https://openweathermap.org/img/wn/$icon@2x.png';
}
