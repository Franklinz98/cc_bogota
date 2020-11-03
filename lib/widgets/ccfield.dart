import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CCField extends StatefulWidget {
  final String labelText;
  final Function validator;
  final TextInputType inputType;
  final bool obscureText;
  final TextEditingController controller;
  final int maxLines;

  const CCField(
      {Key key,
      @required this.controller,
      this.labelText,
      this.validator,
      this.inputType,
      this.obscureText = false,
      this.maxLines = 1})
      : super(key: key);
  @override
  _CCFieldState createState() => _CCFieldState();
}

class _CCFieldState extends State<CCField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: AppColors.ebony,
        borderRadius: BorderRadius.circular(4.00),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText:
              widget.labelText != null ? widget.labelText.toUpperCase() : null,
          labelStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Color(0xff878787),
          ),
        ),
        keyboardType: widget.inputType,
        obscureText: widget.obscureText,
        validator: widget.validator,
        controller: widget.controller,
        maxLines: widget.maxLines,
      ),
    );
  }
}
