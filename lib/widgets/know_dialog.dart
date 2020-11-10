import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/models/know_you_request.dart';
import 'package:cc_bogota/models/school_request.dart';
import 'package:cc_bogota/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KnowDialog extends StatelessWidget {
  final KnowYouRequest request;
  final Function onComplete;

  const KnowDialog({Key key, @required this.request, @required this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.black_russian,
      elevation: 0,
      title: Text(
        'Datos'.toUpperCase(),
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nombre:',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Text(
            request.name,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff878787),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Edad:',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Text(
            request.age,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff878787),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Correo electrónico:',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Text(
            request.email,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff878787),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Teléfono:',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Text(
            request.phone,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff878787),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Dirección:',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Text(
            request.address,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff878787),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          CCButton(
            height: 45,
            color: AppColors.maize,
            child: Text("ELIMINAR SOLICITUD"),
            onPressed: this.onComplete,
          ),
        ],
      ),
    );
  }
}
