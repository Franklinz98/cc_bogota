import 'package:flutter/foundation.dart';

class PfiForm {
  String _key;
  Map _data;

  String get id => _key;

  PfiForm({@required String key, @required Map<String, dynamic> data}) {
    _key = key;
    _data = data;
  }

  dynamic getData(String key) {
    return _data[key];
  }
}
