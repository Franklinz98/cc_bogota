import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/button.dart';

class DetailsView extends StatelessWidget {
  String text;
  final Function onBackPressed;

  DetailsView({Key key, @required this.onBackPressed}) : super(key: key);

  void updateText(String text) {
    this.text = text;
  }

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
                  color: AppColors.genoa,
                  child: Text(
                    "VOLVER",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  onPressed: this.onBackPressed)
            ],
          )
        ],
      ),
    );
  }
}
