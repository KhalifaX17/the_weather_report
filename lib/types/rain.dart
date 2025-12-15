// ignore_for_file: unnecessary_getters_setters, prefer_collection_literals

class Rain {
  double? _d1h;

  Rain({double? d1h}) {
    if (d1h != null) {
      _d1h = d1h;
    }
  }

  double? get d1h => _d1h;
  set d1h(double? d1h) => _d1h = d1h;

  Rain.fromJson(Map<String, dynamic> json) {
    _d1h = json['1h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['1h'] = _d1h;
    return data;
  }
}
