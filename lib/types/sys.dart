// ignore_for_file: unnecessary_getters_setters, prefer_collection_literals

class Sys {
  int? _type;
  int? _id;
  String? _country;
  int? _sunrise;
  int? _sunset;

  Sys({int? type, int? id, String? country, int? sunrise, int? sunset}) {
    if (type != null) {
      _type = type;
    }
    if (id != null) {
      _id = id;
    }
    if (country != null) {
      _country = country;
    }
    if (sunrise != null) {
      _sunrise = sunrise;
    }
    if (sunset != null) {
      _sunset = sunset;
    }
  }

  int? get type => _type;
  set type(int? type) => _type = type;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get country => _country;
  set country(String? country) => _country = country;
  int? get sunrise => _sunrise;
  set sunrise(int? sunrise) => _sunrise = sunrise;
  int? get sunset => _sunset;
  set sunset(int? sunset) => _sunset = sunset;

  Sys.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _id = json['id'];
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = _type;
    data['id'] = _id;
    data['country'] = _country;
    data['sunrise'] = _sunrise;
    data['sunset'] = _sunset;
    return data;
  }
}
