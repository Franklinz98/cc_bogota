import 'package:cc_bogota/backend/authentication.dart';
import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/widgets/ccfield.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function forgottenPasswordTap;

  const Login({
    Key key,
    @required this.forgottenPasswordTap,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email, password;
  Function _validator;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
    _validator = (value) {
      if (value.isEmpty) {
        return 'Por favor llene el campo';
      }
      return null;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/cc_logo.png',
            height: 90,
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "INGRESAR",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
            child: CCField(
              labelText: "Correo electrónico",
              validator: _validator,
              controller: email,
              inputType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
            child: CCField(
              labelText: "Contraseña",
              validator: _validator,
              controller: password,
              obscureText: true,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: GestureDetector(
              child: Text(
                "¿Olvidaste tu contraseña?",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                widget.forgottenPasswordTap.call();
              },
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
            child: CCButton(
                height: 50.0,
                color: AppColors.genoa,
                child: Text("Iniciar Sesión".toUpperCase()),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    signIn(email.text, password.text)
                        .then((user) => Navigator.of(context).pop(user))
                        .catchError((error) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Ocurrio un error. ${error.message}')));
                    });
                  }
                }),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
