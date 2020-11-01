import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  final String text;

  const ContactUs({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            this.text,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w300, fontSize: 14, color: Colors.white),
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CCButton(
                height: 46.0,
                width: 216.0,
                color: AppColors.maize,
                child: Text(
                  "WHATSAPP",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
                onPressed: () async {
                  const url = "https://wa.me/573112148873";
                  if (await canLaunch(url)) launch(url);
                },
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CCButton(
                height: 46.0,
                width: 216.0,
                color: AppColors.maize,
                child: Text(
                  "CORREO ELECTRONICO",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
                onPressed: () async {
                  const url = "mailto:bogotacentrocristiano@gmail.com";
                  if (await canLaunch(url)) launch(url);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
