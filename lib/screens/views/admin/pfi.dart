import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/components/pfi_tile.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/models/pfi_form.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PfiList extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<PfiList> {
  DateTime _dateTime;
  CCState appState;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    appState = Provider.of<CCState>(context, listen: false);
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
          Expanded(
            child: FutureBuilder<List>(
              future: getDocuments('PFI', _dateTime, appState.authToken),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List data = snapshot.data;
                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        PfiForm form = PfiForm(
                            key: data[index]['key'], data: data[index]['data']);
                        return PfiTile(form: form);
                      },
                      itemCount: data.length,
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                }
                // By default, show a loading spinner.
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
