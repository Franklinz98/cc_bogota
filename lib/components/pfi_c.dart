import 'package:cc_bogota/components/categories_chip.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/ccfield.dart';

class FormC extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function onFinish;

  FormC({Key key, @required this.formKey, @required this.onFinish})
      : super(key: key);

  @override
  _FormCState createState() => _FormCState();
}

class _FormCState extends State<FormC> {
  TextEditingController amigo1Controller;
  TextEditingController direccion1Controller;
  TextEditingController telefono1Controller;
  TextEditingController amigo2Controller;
  TextEditingController direccion2Controller;
  TextEditingController telefono2Controller;
  TextEditingController amigo3Controller;
  TextEditingController direccion3Controller;
  TextEditingController telefono3Controller;
  Function _validator;
  final List<String> categories = List();

  @override
  void initState() {
    super.initState();
    amigo1Controller = TextEditingController();
    direccion1Controller = TextEditingController();
    telefono1Controller = TextEditingController();
    amigo2Controller = TextEditingController();
    direccion2Controller = TextEditingController();
    telefono2Controller = TextEditingController();
    amigo3Controller = TextEditingController();
    direccion3Controller = TextEditingController();
    telefono3Controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "MISIÓN AMIGO",
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
          CCField(
            labelText: "Amigo",
            controller: amigo1Controller,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CCField(
                  labelText: "Dirección",
                  controller: direccion1Controller,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "Teléfono",
                  controller: telefono1Controller,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          CCField(
            labelText: "Amigo",
            controller: amigo2Controller,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CCField(
                  labelText: "Dirección",
                  controller: direccion2Controller,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "Teléfono",
                  controller: telefono2Controller,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          CCField(
            labelText: "Amigo",
            controller: amigo3Controller,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CCField(
                  labelText: "Dirección",
                  controller: direccion3Controller,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "Teléfono",
                  controller: telefono3Controller,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "OBSERVACIONES",
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
          UpdateChips(
            updateList: (bool isSelected, String item) {
              if (isSelected) {
                categories.add(item);
              } else {
                categories.remove(item);
              }
            },
          ),
          SizedBox(
            height: 32.0,
          ),
          CCButton(
              height: 60,
              color: AppColors.genoa,
              child: Text("ENVIAR"),
              onPressed: () {
                if (widget.formKey.currentState.validate()) {
                  Map<String, dynamic> formAData = Map();
                  formAData.addAll(<String, dynamic>{
                    'amigo1': amigo1Controller.text,
                    'direccion1': direccion1Controller.text,
                    'telefono1': telefono1Controller.text,
                    'amigo2': amigo2Controller.text,
                    'direccion2': direccion2Controller.text,
                    'telefono2': telefono2Controller.text,
                    'amigo3': amigo3Controller.text,
                    'direccion3': direccion3Controller.text,
                    'telefono3': telefono3Controller.text,
                    'actualizaciones': categories.toString(),
                  });
                  widget.onFinish.call(formAData);
                }
              }),
        ],
      ),
    );
  }
}
