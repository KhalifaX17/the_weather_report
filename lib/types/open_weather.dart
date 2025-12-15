// ignore_for_file: unnecessary_getters_setters, prefer_collection_literals
import 'package:the_weather_report/types/clouds.dart';
import 'package:the_weather_report/types/coord.dart';
import 'package:the_weather_report/types/wind.dart';
import 'package:the_weather_report/types/main.dart';
import 'package:the_weather_report/types/rain.dart';
import 'package:the_weather_report/types/sys.dart';
import 'package:the_weather_report/types/weather.dart';

class OpenWeather {
  Coord? _coord;
  List<Weather>? _weather;
  String? _base;
  Main? _main;
  int? _visibility;
  Wind? _wind;
  Rain? _rain;
  Clouds? _clouds;
  int? _dt;
  Sys? _sys;
  int? _timezone;
  int? _id;
  String? _name;
  int? _cod;

  OpenWeather({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Rain? rain,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    if (coord != null) {
      _coord = coord;
    }
    if (weather != null) {
      _weather = weather;
    }
    if (base != null) {
      _base = base;
    }
    if (main != null) {
      _main = main;
    }
    if (visibility != null) {
      _visibility = visibility;
    }
    if (wind != null) {
      _wind = wind;
    }
    if (rain != null) {
      _rain = rain;
    }
    if (clouds != null) {
      _clouds = clouds;
    }
    if (dt != null) {
      _dt = dt;
    }
    if (sys != null) {
      _sys = sys;
    }
    if (timezone != null) {
      _timezone = timezone;
    }
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (cod != null) {
      _cod = cod;
    }
  }

  Coord? get coord => _coord;
  set coord(Coord? coord) => _coord = coord;
  List<Weather>? get weather => _weather;
  set weather(List<Weather>? weather) => _weather = weather;
  String? get base => _base;
  set base(String? base) => _base = base;
  Main? get main => _main;
  set main(Main? main) => _main = main;
  int? get visibility => _visibility;
  set visibility(int? visibility) => _visibility = visibility;
  Wind? get wind => _wind;
  set wind(Wind? wind) => _wind = wind;
  Rain? get rain => _rain;
  set rain(Rain? rain) => _rain = rain;
  Clouds? get clouds => _clouds;
  set clouds(Clouds? clouds) => _clouds = clouds;
  int? get dt => _dt;
  set dt(int? dt) => _dt = dt;
  Sys? get sys => _sys;
  set sys(Sys? sys) => _sys = sys;
  int? get timezone => _timezone;
  set timezone(int? timezone) => _timezone = timezone;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get cod => _cod;
  set cod(int? cod) => _cod = cod;

  OpenWeather.fromJson(Map<String, dynamic> json) {
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      _weather = <Weather>[];
      json['weather'].forEach((v) {
        _weather!.add(Weather.fromJson(v));
      });
    }
    _base = json['base'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (_coord != null) {
      data['coord'] = _coord!.toJson();
    }
    if (_weather != null) {
      data['weather'] = _weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = _base;
    if (_main != null) {
      data['main'] = _main!.toJson();
    }
    data['visibility'] = _visibility;
    if (_wind != null) {
      data['wind'] = _wind!.toJson();
    }
    if (_rain != null) {
      data['rain'] = _rain!.toJson();
    }
    if (_clouds != null) {
      data['clouds'] = _clouds!.toJson();
    }
    data['dt'] = _dt;
    if (_sys != null) {
      data['sys'] = _sys!.toJson();
    }
    data['timezone'] = _timezone;
    data['id'] = _id;
    data['name'] = _name;
    data['cod'] = _cod;
    return data;
  }
}
