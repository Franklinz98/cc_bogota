import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/models/school_request.dart';
import 'package:cc_bogota/widgets/school_dialog.dart';
import 'package:cc_bogota/screens/views/main/school.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchoolTile extends StatelessWidget {
  final SchoolRequest request;

  const SchoolTile({Key key, @required this.request}) : super(key: key);

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
              builder: (context) => SchoolDialog(request: request),
            );
          },
        ),
      ),
    );
  }
}
