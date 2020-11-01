import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/ccfield.dart';

class FormB extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function onFinish;

  FormB({Key key, @required this.formKey, @required this.onFinish})
      : super(key: key);

  @override
  _FormBState createState() => _FormBState();
}

class _FormBState extends State<FormB> {
  TextEditingController felipesController;
  TextEditingController etiopesController;
  TextEditingController amigosController;
  TextEditingController ninosController;
  TextEditingController ausentesController;
  TextEditingController visitasController;
  TextEditingController cadultosController;
  TextEditingController cninosController;
  TextEditingController reconciliadosController;
  TextEditingController diezmoController;
  TextEditingController ofrendaController;
  TextEditingController totalController;
  TextEditingController mamigoController;
  TextEditingController consolidacionController;
  TextEditingController discipuladoController;
  TextEditingController hermanosController;
  TextEditingController amigos1Controller;
  TextEditingController ninos1Controller;
  TextEditingController veaController;
  TextEditingController escuelaController;
  Function _validator;

  @override
  void initState() {
    super.initState();
    felipesController = TextEditingController();
    etiopesController = TextEditingController();
    amigosController = TextEditingController();
    ninosController = TextEditingController();
    ausentesController = TextEditingController();
    visitasController = TextEditingController();
    cadultosController = TextEditingController();
    cninosController = TextEditingController();
    reconciliadosController = TextEditingController();
    diezmoController = TextEditingController();
    ofrendaController = TextEditingController();
    totalController = TextEditingController();
    mamigoController = TextEditingController();
    consolidacionController = TextEditingController();
    discipuladoController = TextEditingController();
    hermanosController = TextEditingController();
    amigos1Controller = TextEditingController();
    ninos1Controller = TextEditingController();
    veaController = TextEditingController();
    escuelaController = TextEditingController();
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "ASISTENCIA AL GRUPO",
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
          Row(
            children: [
              Expanded(
                child: CCField(
                  labelText: "FELIPES",
                  validator: _validator,
                  controller: felipesController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "ETIOPES",
                  validator: _validator,
                  controller: etiopesController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "AMIGOS",
                  validator: _validator,
                  controller: amigosController,
                  inputType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Expanded(
                child: CCField(
                  labelText: "NIÑOS",
                  validator: _validator,
                  controller: ninosController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "AUSENTES",
                  validator: _validator,
                  controller: ausentesController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "VISITAS",
                  validator: _validator,
                  controller: visitasController,
                  inputType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Expanded(
                child: CCField(
                  labelText: "C. ADULTOS",
                  validator: _validator,
                  controller: cadultosController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "C. NIÑOS",
                  validator: _validator,
                  controller: cninosController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "RECONCILIADOS",
                  validator: _validator,
                  controller: reconciliadosController,
                  inputType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "INFORME FINANCIERO",
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
          Row(
            children: [
              Expanded(
                child: CCField(
                  labelText: "DIEZMO",
                  validator: _validator,
                  controller: diezmoController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "OFRENDA",
                  validator: _validator,
                  controller: ofrendaController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "TOTAL",
                  validator: _validator,
                  controller: totalController,
                  inputType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "REPORTE DE ACTIVIDADES",
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
          Row(
            children: [
              Expanded(
                child: CCField(
                  labelText: "MISIÓN AMIGO",
                  validator: _validator,
                  controller: mamigoController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "CONSOLIDACIÓN",
                  validator: _validator,
                  controller: consolidacionController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "DISCIPULADO 1",
                  validator: _validator,
                  controller: discipuladoController,
                  inputType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Expanded(
                child: CCField(
                  labelText: "HERMANOS",
                  validator: _validator,
                  controller: hermanosController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "AMIGOS",
                  validator: _validator,
                  controller: amigos1Controller,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "NIÑOS",
                  validator: _validator,
                  controller: ninos1Controller,
                  inputType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Expanded(
                child: CCField(
                  labelText: "V.E.A",
                  validator: _validator,
                  controller: veaController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CCField(
                  labelText: "Escuela",
                  validator: _validator,
                  controller: escuelaController,
                  inputType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
          SizedBox(
            height: 32.0,
          ),
          CCButton(
              height: 60,
              color: AppColors.genoa,
              child: Text("SIGUIENTE"),
              onPressed: () {
                if (widget.formKey.currentState.validate()) {
                  Map<String, dynamic> formAData = Map();
                  formAData.addAll(<String, dynamic>{
                    'felipes': felipesController.text,
                    'etiopes': etiopesController.text,
                    'amigos': amigosController.text,
                    'ninos': ninosController.text,
                    'ausentes': ausentesController.text,
                    'visitas': visitasController.text,
                    'cadultos': cadultosController.text,
                    'cninos': cninosController.text,
                    'reconciliados': reconciliadosController.text,
                    'diezmo': diezmoController.text,
                    'ofrenda': ofrendaController.text,
                    'total': totalController.text,
                    'mamigo': mamigoController.text,
                    'consolidacion': consolidacionController.text,
                    'discipulado': discipuladoController.text,
                    'hermanos': hermanosController.text,
                    'amigos1': amigos1Controller.text,
                    'ninos1': ninos1Controller.text,
                    'vea': veaController.text,
                    'escuela': escuelaController.text,
                  });
                  widget.onFinish.call(formAData);
                }
              }),
        ],
      ),
    );
  }
}
