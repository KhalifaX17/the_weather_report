// ignore_for_file: unnecessary_getters_setters, prefer_collection_literals

class Main {
  double? _temp;
  double? _feelsLike;
  double? _tempMin;
  double? _tempMax;
  int? _pressure;
  int? _humidity;
  int? _seaLevel;
  int? _grndLevel;

  Main({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) {
    if (temp != null) {
      _temp = temp;
    }
    if (feelsLike != null) {
      _feelsLike = feelsLike;
    }
    if (tempMin != null) {
      _tempMin = tempMin;
    }
    if (tempMax != null) {
      _tempMax = tempMax;
    }
    if (pressure != null) {
      _pressure = pressure;
    }
    if (humidity != null) {
      _humidity = humidity;
    }
    if (seaLevel != null) {
      _seaLevel = seaLevel;
    }
    if (grndLevel != null) {
      _grndLevel = grndLevel;
    }
  }

  double? get temp => _temp;
  set temp(double? temp) => _temp = temp;
  double? get feelsLike => _feelsLike;
  set feelsLike(double? feelsLike) => _feelsLike = feelsLike;
  double? get tempMin => _tempMin;
  set tempMin(double? tempMin) => _tempMin = tempMin;
  double? get tempMax => _tempMax;
  set tempMax(double? tempMax) => _tempMax = tempMax;
  int? get pressure => _pressure;
  set pressure(int? pressure) => _pressure = pressure;
  int? get humidity => _humidity;
  set humidity(int? humidity) => _humidity = humidity;
  int? get seaLevel => _seaLevel;
  set seaLevel(int? seaLevel) => _seaLevel = seaLevel;
  int? get grndLevel => _grndLevel;
  set grndLevel(int? grndLevel) => _grndLevel = grndLevel;

  Main.fromJson(Map<String, dynamic> json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _seaLevel = json['sea_level'];
    _grndLevel = json['grnd_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['temp'] = _temp;
    data['feels_like'] = _feelsLike;
    data['temp_min'] = _tempMin;
    data['temp_max'] = _tempMax;
    data['pressure'] = _pressure;
    data['humidity'] = _humidity;
    data['sea_level'] = _seaLevel;
    data['grnd_level'] = _grndLevel;
    return data;
  }
}
