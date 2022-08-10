import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_test_app/core/models/weather_dto.dart';

class ApiClient {
  final Dio dioClient = Dio();
  final httpClient = HttpClient();

  static const _baseUrl = 'api.openweathermap.org';
  static const _apiKey = '7bdd106ed2307f9cdfa9b0c65a7ef0fc';

  Future<WeatherDto?> loadCurrentWeather(String city) async {
    final url = Uri.https(
      _baseUrl,
      'data/2.5/weather',
      <String, String>{'appid': _apiKey, 'q': city, 'units': 'metric'},
    );
    try {
      final request = await httpClient.getUrl(url);
      final response = await request.close();
      if (response.statusCode == 200) {
        final json = await response
            .transform(utf8.decoder)
            .toList()
            .then((value) => value.join())
            .then((value) => jsonDecode(value) as Map<String, dynamic>);
        final result = WeatherDto.fromJson(json);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
