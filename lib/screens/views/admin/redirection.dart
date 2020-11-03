import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/models/viewData.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/widgets/ccfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Redirect extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<Redirect> {
  CCState appState;
  GlobalKey<FormState> formKey = GlobalKey();
  Function _validator;
  TextEditingController donation,
      email,
      facebook,
      instagram,
      pictures,
      videos,
      website,
      whatsapp,
      youtube;

  @override
  void initState() {
    super.initState();
    appState = Provider.of<CCState>(context, listen: false);
    donation = TextEditingController(text: appState.redirect['donations']);
    email = TextEditingController(text: appState.redirect['email']);
    facebook = TextEditingController(text: appState.redirect['facebook']);
    instagram = TextEditingController(text: appState.redirect['instagram']);
    pictures = TextEditingController(text: appState.redirect['pictures']);
    videos = TextEditingController(text: appState.redirect['videos']);
    website = TextEditingController(text: appState.redirect['website']);
    whatsapp = TextEditingController(text: appState.redirect['whatsapp']);
    youtube = TextEditingController(text: appState.redirect['youtube']);
    _validator = (value) {
      if (value.isEmpty) {
        return 'Por favor llene el campo';
      }
      return null;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 24.0, left: 16.0, right: 16.0, bottom: 8.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ENLACES DE REDIRECCIÓN',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                'Sitio web:',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 12.0,
              ),
              CCField(
                validator: _validator,
                controller: website,
                inputType: TextInputType.url,
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                'Facebook:',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 12.0,
              ),
              CCField(
                validator: _validator,
                controller: facebook,
                inputType: TextInputType.url,
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                'Instagram:',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 12.0,
              ),
              CCField(
                validator: _validator,
                controller: instagram,
                inputType: TextInputType.url,
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                'YouTube:',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 12.0,
              ),
              CCField(
                validator: _validator,
                controller: youtube,
                inputType: TextInputType.url,
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                'WhatsApp:',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 12.0,
              ),
              CCField(
                validator: _validator,
                controller: whatsapp,
                inputType: TextInputType.phone,
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                'Correo electrónico:',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 12.0,
              ),
              CCField(
                validator: _validator,
                controller: email,
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                'Donaciones:',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 12.0,
              ),
              CCField(
                validator: _validator,
                controller: donation,
                inputType: TextInputType.url,
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                'Fotos:',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 12.0,
              ),
              CCField(
                validator: _validator,
                controller: pictures,
                inputType: TextInputType.url,
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                'Videos:',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 12.0,
              ),
              CCField(
                validator: _validator,
                controller: videos,
                inputType: TextInputType.url,
              ),
              SizedBox(
                height: 24.0,
              ),
              CCButton(
                height: 50.0,
                color: AppColors.genoa,
                child: Text("Aceptar".toUpperCase()),
                onPressed: () {
                  var map = {
                    'email': email.text,
                    'donations': donation.text,
                    'facebook': facebook.text,
                    'videos': videos.text,
                    'website': website.text,
                    'instagram': instagram.text,
                    'youtube': youtube.text,
                    'pictures': pictures.text,
                    'whatsapp': whatsapp.text,
                  };
                  appState.updateRedirect(map);
                  ViewData viewData = ViewData(map: map);
                  updateViewData('redirect', viewData, ViewType.redirect,
                          appState.authToken)
                      .then(
                        (value) => Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Enlaces actualizados.'),
                          ),
                        ),
                      )
                      .catchError(
                        (error) => Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Hubo un error, intentalo nuevamente.'),
                          ),
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    donation.dispose();
    email.dispose();
    facebook.dispose();
    instagram.dispose();
    pictures.dispose();
    videos.dispose();
    website.dispose();
    whatsapp.dispose();
    youtube.dispose();
    super.dispose();
  }
}
