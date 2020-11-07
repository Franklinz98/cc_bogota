import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CCDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GestureTapCallback onStart,
      onMedia,
      onMinistries,
      onDonations,
      onKnowYou,
      onContact,
      onPFI,
      onPP,
      onTC,
      onLogin,
      onLogOff;

  const CCDrawer({
    Key key,
    @required this.scaffoldKey,
    @required this.onStart,
    @required this.onMedia,
    @required this.onMinistries,
    @required this.onDonations,
    @required this.onKnowYou,
    @required this.onContact,
    @required this.onPFI,
    @required this.onPP,
    @required this.onTC,
    @required this.onLogin,
    @required this.onLogOff,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.shark,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
              Image.asset(
                'assets/images/cc_logo.png',
                height: 58,
              ),
              SizedBox(
                height: 18,
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Inicio",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                onTap: this.onStart,
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Multimedia",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                onTap: this.onMedia,
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Ministerios",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                onTap: this.onMinistries,
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Plan Felipe Integral",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                onTap: this.onPFI,
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Donaciones",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                onTap: this.onDonations,
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Inscripción Ruta Acádemica",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                onTap: this.onKnowYou,
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Contactanos",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                onTap: this.onContact,
              ),
              Spacer(),
              GestureDetector(
                child: Text(
                  "Política de Privacidad",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Color(0xffbbbbbb),
                  ),
                ),
                onTap: this.onPP,
              ),
              SizedBox(
                height: 16.0,
              ),
              GestureDetector(
                child: Text(
                  "Términos y Condiciones",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Color(0xffbbbbbb),
                  ),
                ),
                onTap: this.onTC,
              ),
              Spacer(),
              Provider.of<CCState>(context, listen: true).authToken == null
                  ? ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Iniciar Sesión",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                      onTap: this.onLogin,
                    )
                  : ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Cerrar Sesión",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                      onTap: this.onLogOff,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
