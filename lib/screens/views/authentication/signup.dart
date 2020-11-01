import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/widgets/ccfield.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          "REGISTRARSE",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
          child: CCField(
            labelText: "Nombre",
            validator: null,
            controller: null,
            inputType: TextInputType.emailAddress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
          child: CCField(
            labelText: "Correo electrónico",
            validator: null,
            controller: null,
            inputType: TextInputType.emailAddress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
          child: CCField(
            labelText: "Contraseña",
            validator: null,
            controller: null,
            obscureText: true,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
          child: CCButton(
              height: 50.0,
              color: AppColors.genoa,
              child: Text("Crear Cuenta".toUpperCase()),
              onPressed: () {}),
        ),
      ],
    );
  }
}
