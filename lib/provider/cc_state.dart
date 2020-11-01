import 'package:cc_bogota/constants/enums.dart';
import 'package:flutter/foundation.dart';

class CCState extends ChangeNotifier {
  String _userToken;
  AuthType _clearance;

  String get authToken => _userToken;
  AuthType get userClearance => _clearance;

  void updateToken({String token}) {
    _userToken = token;
    notifyListeners();
  }

  void updateClearanceLevel({String clearance}) {
    if (clearance != null) {
      _clearance = clearance == 'admins' ? AuthType.admin : AuthType.leader;
    } else {
      _clearance = AuthType.none;
    }
  }
}
