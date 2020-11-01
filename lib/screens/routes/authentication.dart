import 'package:cc_bogota/backend/authentication.dart';
import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/screens/views/authentication/login.dart';
import 'package:cc_bogota/screens/views/authentication/recover_password.dart';
import 'package:cc_bogota/screens/views/authentication/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthenticationRoute extends StatefulWidget {
  @override
  _RouteState createState() => _RouteState();
}

class _RouteState extends State<AuthenticationRoute> {
  Widget _content;
  AuthScreen _authScreen;

  @override
  void initState() {
    _content = Login(
      forgottenPasswordTap: () {
        setState(() {
          _authScreen = AuthScreen.forgotten;
          updateScreen();
        });
      },
    );
    // TODO DELETE
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: _content,
        ),
      ),
    );
  }

  updateScreen() {
    switch (_authScreen) {
      case AuthScreen.login:
        _content = Login(
          forgottenPasswordTap: () {
            setState(() {
              _authScreen = AuthScreen.forgotten;
              updateScreen();
            });
          },
        );
        break;
      case AuthScreen.forgotten:
        _content = RecoverP(onScreenSwitch: () {
          setState(() {
            _authScreen = AuthScreen.login;
            updateScreen();
          });
        });
        break;
    }
  }
}
