// ignore_for_file: unnecessary_getters_setters, prefer_collection_literals

class Coord {
  double? _lon;
  double? _lat;

  Coord({double? lon, double? lat}) {
    if (lon != null) {
      _lon = lon;
    }
    if (lat != null) {
      _lat = lat;
    }
  }

  double? get lon => _lon;
  set lon(double? lon) => _lon = lon;
  double? get lat => _lat;
  set lat(double? lat) => _lat = lat;

  Coord.fromJson(Map<String, dynamic> json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lon'] = _lon;
    data['lat'] = _lat;
    return data;
  }
}
