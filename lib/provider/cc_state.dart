import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/models/viewData.dart';
import 'package:flutter/foundation.dart';

class CCState extends ChangeNotifier {
  String _userToken;
  AuthType _clearance;
  ContentScreen _contentScreen = ContentScreen.home;
  ContentViews _contentView;
  ViewData _viewData;
  Map _redirect;

  String get authToken => _userToken;
  AuthType get userClearance => _clearance;
  ContentScreen get screen => _contentScreen;
  ContentViews get view => _contentView;
  ViewData get viewData => _viewData;
  Map get redirect => _redirect;

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

  void updateContentScreen(ContentScreen screen) {
    _contentScreen = screen;
    notifyListeners();
  }

  void updateContentView(ContentViews view) {
    _contentView = view;
    _contentScreen = ContentScreen.view;
    notifyListeners();
  }

  void updateViewdata(ViewData viewData) {
    _viewData = viewData;
  }

  void updateRedirect(Map map) {
    _redirect = map;
  }
}
