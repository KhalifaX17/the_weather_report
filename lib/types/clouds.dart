// ignore_for_file: unnecessary_getters_setters, prefer_collection_literals

class Clouds {
  int? _all;

  Clouds({int? all}) {
    if (all != null) {
      _all = all;
    }
  }

  int? get all => _all;
  set all(int? all) => _all = all;

  Clouds.fromJson(Map<String, dynamic> json) {
    _all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['all'] = _all;
    return data;
  }
}
