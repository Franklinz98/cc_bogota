import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/models/pfi_form.dart';
import 'package:cc_bogota/widgets/pfi_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PfiTile extends StatelessWidget {
  final PfiForm form;
  final String id;

  const PfiTile({Key key, @required this.id, @required this.form})
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
            Icons.drive_file_rename_outline,
            color: Colors.white,
          ),
          title: Text(
            this.id,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => PfiDialog(form: form),
            );
          },
        ),
      ),
    );
  }
}
