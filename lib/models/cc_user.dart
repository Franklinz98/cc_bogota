import 'package:flutter/foundation.dart';

class CCUser {
  final String _uid;
  final String _token;

  const CCUser({@required String firebaseID, @required String sessionToken})
      : this._uid = firebaseID,
        this._token = sessionToken;

  String get firebaseID => this._uid;
  String get jwtToken => this._token;
}
