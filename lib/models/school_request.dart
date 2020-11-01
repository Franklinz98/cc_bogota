import 'package:flutter/foundation.dart';

class SchoolRequest {
  String _name, _email, _phone;

  SchoolRequest(
      {@required String name, @required String email, @required String phone}) {
    this._name = name;
    this._email = email;
    this._phone = phone;
  }

  String get name => _name;
  String get email => _email;
  String get phone => _phone;

  Map<String, dynamic> toJson() => {
        'name': _name,
        'email': _email,
        'phone': _phone,
      };

  factory SchoolRequest.fromJson(Map map) {
    return SchoolRequest(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}
