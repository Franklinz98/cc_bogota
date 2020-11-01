import 'package:flutter/foundation.dart';

class PfiForm {
  Map _data;

  PfiForm({@required Map<String, dynamic> data}) : _data = data;

  dynamic getData(String key) {
    return _data[key];
  }
}
