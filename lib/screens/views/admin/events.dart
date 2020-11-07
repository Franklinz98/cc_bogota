import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/models/event.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/widgets/ccfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cc_bogota/backend/requets.dart';

class PostEvent extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<PostEvent> {
  GlobalKey<FormState> formKey = GlobalKey();
  Function _validator;
  TextEditingController text;
  CCState _appState;
  DateTime _dateTime, _minDate, _maxDate;
  DateFormat _dateFormat;

  @override
  void initState() {
    super.initState();
    text = TextEditingController();
    _validator = (value) {
      if (value.isEmpty) {
        return 'Por favor llene el campo';
      }
      return null;
    };
    _appState = Provider.of<CCState>(context, listen: false);
    int millisSE = DateTime.now().millisecondsSinceEpoch;
    _minDate = DateTime.fromMillisecondsSinceEpoch(
        millisSE + Duration(days: 1).inMilliseconds);
    _maxDate = DateTime.fromMillisecondsSinceEpoch(
        millisSE + Duration(days: 8).inMilliseconds);
    _dateTime = _minDate;
    _dateFormat = DateFormat.yMd().add_jm();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 24.0, left: 16.0, right: 16.0, bottom: 8.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Fecha:',
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.ebony.withOpacity(0.4),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        _dateFormat.format(_dateTime),
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
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
                          minTime: _minDate,
                          maxTime: _maxDate, onConfirm: (date) {
                        setState(() {
                          _dateTime = date;
                        });
                      }, currentTime: _dateTime, locale: LocaleType.es);
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Texto:',
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 12.0,
            ),
            CCField(
              validator: _validator,
              controller: text,
            ),
            SizedBox(
              height: 24.0,
            ),
            CCButton(
              height: 50.0,
              color: AppColors.genoa,
              child: Text("Aceptar".toUpperCase()),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  CCEvent event =
                      CCEvent(title: text.text, dateTime: _dateTime);
                  postCCEvent(event, _appState.authToken).then((value) =>
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Evento publicado.'))));
                } else {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Ingrese el titulo del evento.')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }
}
