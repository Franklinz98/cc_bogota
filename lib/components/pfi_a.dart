import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/ccfield.dart';

class FormA extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function onFinish;

  FormA({Key key, @required this.formKey, @required this.onFinish})
      : super(key: key);

  @override
  _FormAState createState() => _FormAState();
}

class _FormAState extends State<FormA> {
  TextEditingController supervisorController,
      groupPhilipController,
      code,
      groupName,
      address,
      leader,
      assistant,
      childrenT,
      host;
  Function _validator;

  @override
  void initState() {
    super.initState();
    supervisorController = TextEditingController();
    groupPhilipController = TextEditingController();
    code = TextEditingController();
    groupName = TextEditingController();
    address = TextEditingController();
    leader = TextEditingController();
    assistant = TextEditingController();
    childrenT = TextEditingController();
    host = TextEditingController();
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
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          CCField(
            labelText: "SUPERVISOR DE RED",
            validator: _validator,
            controller: supervisorController,
          ),
          SizedBox(
            height: 16.0,
          ),
          CCField(
            labelText: "Felipe de grupos",
            validator: _validator,
            controller: groupPhilipController,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: CCField(
                  labelText: "Código",
                  validator: _validator,
                  controller: code,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                flex: 2,
                child: CCField(
                  labelText: "Nombre del Grupo",
                  validator: _validator,
                  controller: groupName,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          CCField(
            labelText: "Dirección",
            validator: _validator,
            controller: address,
          ),
          SizedBox(
            height: 16.0,
          ),
          CCField(
            labelText: "Felipe Líder",
            validator: _validator,
            controller: leader,
          ),
          SizedBox(
            height: 16.0,
          ),
          CCField(
            labelText: "Asistente",
            validator: _validator,
            controller: assistant,
          ),
          SizedBox(
            height: 16.0,
          ),
          CCField(
            labelText: "Maestro de niños",
            validator: _validator,
            controller: childrenT,
          ),
          SizedBox(
            height: 16.0,
          ),
          CCField(
            labelText: "Anfitrión",
            validator: _validator,
            controller: host,
          ),
          SizedBox(
            height: 24.0,
          ),
          CCButton(
              height: 60,
              color: AppColors.genoa,
              child: Text("SIGUIENTE"),
              onPressed: () {
                if (widget.formKey.currentState.validate()) {
                  Map<String, dynamic> formAData = Map();
                  formAData.addAll(<String, dynamic>{
                    'supervisor': supervisorController.text,
                    'felipe': groupPhilipController.text,
                    'codigo': code.text,
                    'nombre': groupName.text,
                    'direccion': address.text,
                    'lider': leader.text,
                    'asistente': assistant.text,
                    'maestro': childrenT.text,
                    'anfitrion': host.text,
                  });
                  widget.onFinish.call(formAData);
                }
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    supervisorController.dispose();
    groupPhilipController.dispose();
    code.dispose();
    groupName.dispose();
    address.dispose();
    leader.dispose();
    assistant.dispose();
    childrenT.dispose();
    host.dispose();
    super.dispose();
  }
}
