import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  String text;

  ContactUs({
    Key key,
  }) : super(key: key);

  void updateText(String text) {
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    CCState appState = Provider.of<CCState>(context, listen: false);
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
                  final url =
                      "https://wa.me/57${appState.redirect['whatsapp']}";
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
                  final url = "mailto:${appState.redirect['email']}";
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
