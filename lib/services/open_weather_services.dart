import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:the_weather_report/types/open_weather.dart';

class OpenWeatherService {
  static Future<OpenWeather> fetch(String apikey) async {
    var position = await OpenWeatherService.determineCurrentPosition();
    var url =
        "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apikey";
    var result = await http.get(Uri.parse(url));
    if (result.statusCode != 200) {
      return Future.error(
        "Some thing went wrong!, can't get data from openweather api..",
      );
    }
    var objectResult = jsonDecode(result.body);
    return OpenWeather.fromJson(objectResult);
  }

  static Future<Position> determineCurrentPosition() async {
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
