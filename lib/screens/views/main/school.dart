import 'package:cc_bogota/backend/authentication.dart';
import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/models/school_request.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/widgets/ccfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchoolReg extends StatefulWidget {
  final Function onFinish;

  SchoolReg({Key key, @required this.onFinish}) : super(key: key);

  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<SchoolReg> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  Function _validator;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Ingresa los siguientes datos para solicitar tu inscripción a nuestra ruta acádemica:",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            CCField(
              labelText: "Nombre",
              controller: nameController,
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CCField(
                    labelText: "Correo Electrónico",
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: CCField(
                    labelText: "Teléfono",
                    controller: phoneController,
                    inputType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32.0,
            ),
            CCButton(
                height: 60,
                color: AppColors.genoa,
                child: Text("ENVIAR"),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    SchoolRequest request = SchoolRequest(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                    );
                    sentSchoolRequest(
                      request,
                      Provider.of<CCState>(context, listen: false).authToken,
                    ).then((value) {
                      widget.onFinish.call();
                    });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
