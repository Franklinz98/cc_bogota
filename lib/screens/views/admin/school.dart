import 'package:cc_bogota/components/school_tile.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/models/school_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RequestList extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<RequestList> {
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
          SchoolTile(
            request: SchoolRequest(
                name: 'Nombre Test',
                email: 'test@user.com',
                phone: '3215694154'),
          ),
        ],
      ),
    );
  }
}
