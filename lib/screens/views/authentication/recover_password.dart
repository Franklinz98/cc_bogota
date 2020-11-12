import 'package:cc_bogota/backend/authentication.dart';
import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/widgets/ccfield.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';

class RecoverP extends StatefulWidget {
  final Function onScreenSwitch;

  const RecoverP({
    Key key,
    @required this.onScreenSwitch,
  }) : super(key: key);

  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<RecoverP> {
  TextEditingController email;
  Function _validator;
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    _validator = (value) {
      if (value.isEmpty) {
        return 'Por favor llene el campo';
      }
      return null;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
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
              "REESTABLECER CONTRASEÑA",
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
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
              child: CCButton(
                  height: 50.0,
                  color: AppColors.genoa,
                  child: Text("Recuperar Contraseña".toUpperCase()),
                  onPressed: () {
                    recover(email.text)
                        .then((value) => widget.onScreenSwitch.call())
                        .catchError((error) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Ocurrio un error. ${error.message}')));
                    });
                  }),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                widget.onScreenSwitch.call();
              }),
        )
      ],
    );
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
