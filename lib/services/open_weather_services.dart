import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:the_weather_report/types/open_weather.dart';

class OpenWeatherService {
  // Private named constructor
  OpenWeatherService._internal();

  // The single instance (lazy initialization)
  static final OpenWeatherService _instance = OpenWeatherService._internal();

  // Factory constructor returns the same instance every time
  factory OpenWeatherService() {
    return _instance;
  }

  String get baseUrl {
    var apiKey = dotenv.env['OPEN_WEATHER_API_KEY'];
    return "https://api.openweathermap.org/data/2.5/weather?appid=$apiKey";
  }

  Future<OpenWeather> fetch() async {
    var position = await determineCurrentPosition();
    var url = "$baseUrl&lat=${position.latitude}&lon=${position.longitude}";
    var result = await http.get(Uri.parse(url));
    if (result.statusCode != 200) {
      return Future.error("Failed to fetch weather data");
    }
    var objectResult = jsonDecode(result.body);
    return OpenWeather.fromJson(objectResult);
  }

  Future<Position> determineCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    return await Geolocator.getCurrentPosition();
  }
}
