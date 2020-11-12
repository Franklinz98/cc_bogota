import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/models/know_you_request.dart';
import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/widgets/ccfield.dart';
import 'package:flutter/material.dart';

class KnowYou extends StatefulWidget {
  final Function onFinish;

  KnowYou({Key key, @required this.onFinish}) : super(key: key);

  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<KnowYou> {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  TextEditingController ageController;
  TextEditingController addressController;
  Function _validator;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    ageController = TextEditingController();
    addressController = TextEditingController();
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
              "Ingresa los siguientes datos, queremos saber mas de ti:",
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
              validator: _validator,
              controller: nameController,
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CCField(
                    labelText: "Edad",
                    validator: _validator,
                    controller: ageController,
                    inputType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: CCField(
                    labelText: "Teléfono",
                    validator: _validator,
                    controller: phoneController,
                    inputType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CCField(
                    labelText: "Correo Electrónico",
                    validator: _validator,
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: CCField(
                    labelText: "Dirección",
                    validator: _validator,
                    controller: addressController,
                    inputType: TextInputType.streetAddress,
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
                    KnowYouRequest request = KnowYouRequest(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      age: ageController.text,
                      address: addressController.text,
                    );
                    sentKnowYouRequest(
                      request,
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
