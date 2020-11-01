import 'package:cc_bogota/components/pfi_tile.dart';
import 'package:cc_bogota/components/school_tile.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/models/pfi_form.dart';
import 'package:cc_bogota/models/school_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PfiList extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<PfiList> {
  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '${DateFormat('MMMM, y', 'es-CO').format(_dateTime)}'
                    .toUpperCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              DatePicker.showDatePicker(context,
                  theme: DatePickerTheme(
                    backgroundColor: AppColors.black_russian,
                    headerColor: AppColors.shark,
                    itemStyle: TextStyle(
                      color: Colors.white,
                    ),
                    doneStyle: TextStyle(
                      color: AppColors.maize,
                    ),
                    cancelStyle: TextStyle(
                      color: Color(0xff878787),
                    ),
                  ),
                  showTitleActions: true,
                  minTime: DateTime(2020, 2, 10),
                  maxTime: DateTime.now(), onConfirm: (date) {
                setState(() {
                  _dateTime = date;
                });
              }, currentTime: _dateTime, locale: LocaleType.es);
            },
          ),
          PfiTile(
            id: '1245_011450',
            form: _form(),
          ),
        ],
      ),
    );
  }

  // TODO delete
  PfiForm _form() {
    return PfiForm(data: {
      'supervisor': 'supervisorController.text',
      'felipe': 'groupPhilipController.text',
      'codigo': 1245,
      'nombre': 'groupName.text',
      'direccion': 'address.text',
      'lider': 'leader.text',
      'asistente': 'assistant.text',
      'maestro': 'childrenT.text',
      'anfitrion': 'host.text',
      'felipes': 5,
      'etiopes': 4,
      'amigos': 6,
      'ninos': 4,
      'ausentes': 6,
      'visitas': 4,
      'cadultos': 5,
      'cninos': 2,
      'reconciliados': 0,
      'diezmo': 2500,
      'ofrenda': 5000,
      'total': 7500,
      'mamigo': 2,
      'consolidacion': 4,
      'discipulado': 4,
      'hermanos': 4,
      'amigos1': 5,
      'ninos1': 4,
      'vea': 5,
      'escuela': 4,
      'amigo1': 'amigo1Controller.text',
      'direccion1': 'direccion1Controller.text',
      'telefono1': 'telefono1Controller.text',
      'amigo2': 'amigo2Controller.text',
      'direccion2': 'direccion2Controller.text',
      'telefono2': 'telefono2Controller.text',
      'amigo3': 'amigo3Controller.text',
      'direccion3': 'direccion3Controller.text',
      'telefono3': 'telefono3Controller.text',
      'actualizaciones': '[asd,rtty,dffg,qw]',
    });
  }
}
