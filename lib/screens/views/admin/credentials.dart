import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/widgets/ccfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CredentialsManagement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WidgetState();
}

class _WidgetState extends State<CredentialsManagement> {
  CredentialOp _operation = CredentialOp.signUp;
  TextEditingController email;
  Function _validator;
  GlobalKey<FormState> formKey = GlobalKey();
  CCState appState;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    _validator = (value) {
      if (value.isEmpty) {
        return 'Por favor llene el campo';
      }
      return null;
    };
    appState = Provider.of<CCState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 24.0, left: 16.0, right: 16.0, bottom: 8.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Operación a realizar:',
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            ListTile(
              dense: true,
              title: Text(
                'Crear cuenta de usuario.',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              leading: Radio(
                activeColor: AppColors.maize,
                value: CredentialOp.signUp,
                groupValue: _operation,
                onChanged: (CredentialOp value) {
                  setState(() {
                    _operation = value;
                  });
                },
              ),
            ),
            ListTile(
              dense: true,
              title: Text(
                'Hacer administrador.',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              leading: Radio(
                activeColor: AppColors.maize,
                value: CredentialOp.grantAdmin,
                groupValue: _operation,
                onChanged: (CredentialOp value) {
                  setState(() {
                    _operation = value;
                  });
                },
              ),
            ),
            ListTile(
              dense: true,
              title: Text(
                'Hacer líder.',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              leading: Radio(
                activeColor: AppColors.maize,
                value: CredentialOp.grantLeader,
                groupValue: _operation,
                onChanged: (CredentialOp value) {
                  setState(() {
                    _operation = value;
                  });
                },
              ),
            ),
            ListTile(
              dense: true,
              title: Text(
                'Eliminar credenciales.',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              leading: Radio(
                activeColor: AppColors.maize,
                value: CredentialOp.removeCredentials,
                groupValue: _operation,
                onChanged: (CredentialOp value) {
                  setState(() {
                    _operation = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Correo electrónico del usuario:',
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 16.0,
            ),
            CCField(
              validator: _validator,
              controller: email,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 12.0,
            ),
            CCButton(
                height: 50.0,
                color: AppColors.genoa,
                child: Text("Aceptar".toUpperCase()),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    switch (_operation) {
                      case CredentialOp.signUp:
                        createAccount(email.text, appState.authToken)
                            .then((value) {
                          switch (value) {
                            case true:
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Cuenta creada.')));
                              break;
                            case false:
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'El correo ya existe en la base de datos.')));
                              break;
                            default:
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Hubo un error, intentalo de nuevo.')));
                          }
                        });
                        break;
                      case CredentialOp.grantAdmin:
                        addStaff(email.text, 'admins', appState.authToken)
                            .then((value) {
                          if (value) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Credenciales de administrador agregadas.')));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'No se pudieron agregar las credenciales de administrador agregadas.')));
                          }
                        });
                        break;
                      case CredentialOp.grantLeader:
                        addStaff(email.text, 'leaders', appState.authToken)
                            .then((value) {
                          if (value) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content:
                                    Text('Credenciales de líder agregadas.')));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'No se pudieron agregar las credenciales de líder agregadas.')));
                          }
                        });
                        break;
                      case CredentialOp.removeCredentials:
                        removeCredentials(
                                email.text, 'admins', appState.authToken)
                            .then((value) {
                          if (value) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content:
                                    Text('Credenciales de líder eliminadas.')));
                          } else {
                            removeCredentials(
                                    email.text, 'leaders', appState.authToken)
                                .then((value) {
                              if (value) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Credenciales de líder eliminadas.')));
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'No se pudieron eliminar las credenciales.')));
                              }
                            });
                          }
                        });
                        break;
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
