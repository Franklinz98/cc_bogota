import 'package:flutter/foundation.dart';

class KnowYouRequest {
  String _name, _email, _phone, _key, _age, _address;

  KnowYouRequest(
      {String id,
      @required String name,
      @required String email,
      @required String age,
      @required String address,
      @required String phone}) {
    this._key = id;
    this._name = name;
    this._email = email;
    this._phone = phone;
    this._age = age;
    this._address = address;
  }

  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get id => _key;
  String get age => _age;
  String get address => _address;

  Map<String, dynamic> toJson() => {
        'name': _name,
        'email': _email,
        'phone': _phone,
        'age': _age,
        'address': _address,
      };

  factory KnowYouRequest.fromJson(String key, Map map) {
    return KnowYouRequest(
      id: key,
      name: map['name'].toString(),
      email: map['email'].toString(),
      phone: map['phone'].toString(),
      age: map['age'].toString(),
      address: map['address'].toString(),
    );
  }
}
