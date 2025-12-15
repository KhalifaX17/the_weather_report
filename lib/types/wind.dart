// ignore_for_file: unnecessary_getters_setters, prefer_collection_literals

class Wind {
  double? _speed;
  int? _deg;
  double? _gust;

  Wind({double? speed, int? deg, double? gust}) {
    if (speed != null) {
      _speed = speed;
    }
    if (deg != null) {
      _deg = deg;
    }
    if (gust != null) {
      _gust = gust;
    }
  }

  double? get speed => _speed;
  set speed(double? speed) => _speed = speed;
  int? get deg => _deg;
  set deg(int? deg) => _deg = deg;
  double? get gust => _gust;
  set gust(double? gust) => _gust = gust;

  Wind.fromJson(Map<String, dynamic> json) {
    _speed = json['speed'];
    _deg = json['deg'];
    _gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['speed'] = _speed;
    data['deg'] = _deg;
    data['gust'] = _gust;
    return data;
  }
}
