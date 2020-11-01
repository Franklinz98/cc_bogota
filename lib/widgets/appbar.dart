import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CCAppBar extends StatelessWidget {
  final AppBarType type;
  final String title;
  final bool showIcons;
  final VoidCallback onTapMenu, onTapProfile;

  const CCAppBar(
      {Key key,
      @required this.type,
      this.onTapMenu,
      this.showIcons = true,
      this.onTapProfile,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.00,
      color: AppColors.woodsmoke.withOpacity(0.6),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Visibility(
            visible: this.showIcons,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: this.onTapMenu,
            ),
          ),
          Expanded(
            child: this.type == AppBarType.start
                ? Image.asset(
                    'assets/images/cc_logo.png',
                    height: 36,
                  )
                : Text(
                    this.title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
          ),
          Visibility(
            visible: this.showIcons,
            child: IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                onPressed: this.onTapProfile),
          ),
        ],
      ),
    );
  }
}
