import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/models/know_you_request.dart';
import 'package:cc_bogota/models/school_request.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/widgets/know_dialog.dart';
import 'package:cc_bogota/widgets/school_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cc_bogota/backend/requets.dart';

class KnowTile extends StatelessWidget {
  final KnowYouRequest request;
  final CCState appState;
  final DateTime date;
  final Function refresh;

  const KnowTile(
      {Key key,
      @required this.request,
      @required this.appState,
      @required this.date,
      @required this.refresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        // padding: this.edgeInsets,
        decoration: BoxDecoration(
          color: AppColors.woodsmoke.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.00),
        ),
        child: ListTile(
          leading: Icon(
            Icons.person_outline_rounded,
            color: Colors.white,
          ),
          title: Text(
            request.name,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => KnowDialog(
                request: request,
                onComplete: () {
                  deleteKnowYouRequest(request, date, appState.authToken)
                      .then((value) {
                    Navigator.of(context).pop();
                    this.refresh.call();
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
