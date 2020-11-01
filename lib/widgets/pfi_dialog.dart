import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/models/pfi_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PfiDialog extends StatelessWidget {
  final PfiForm form;

  const PfiDialog({Key key, @required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.black_russian,
      elevation: 0,
      title: Text(
        'Informe PFI'.toUpperCase(),
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 500,
            ),
            Text(
              'Supervisor de Red:',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              form.getData('supervisor'),
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
              'Felipe de Grupos:',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              form.getData('felipe'),
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff878787),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Text(
                  'Código: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('codigo').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Nombre del grupo:',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              form.getData('nombre'),
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
              form.getData('direccion'),
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
              'Felipe Líder:',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              form.getData('lider'),
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
              'Asistente:',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              form.getData('asistente'),
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
              'Maestro de niños:',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              form.getData('maestro'),
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
              'Anfitrión:',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              form.getData('anfitrion'),
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff878787),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              "ASISTENCIA AL GRUPO",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Text(
                  'Felipes: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('felipes').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
                Text(
                  'Etiopes: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('etiopes').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
                Text(
                  'Amigos: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('amigos').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Text(
                  'Niños: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('ninos').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
                Text(
                  'Ausentes: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('ausentes').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
                Text(
                  'Visitas: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('visitas').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Text(
                  'C. Adultos: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('cadultos').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
                Text(
                  'C. Niños: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('cninos').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
                Text(
                  'Recon: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('reconciliados').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            /* Row(
              children: [
                Text(
                  'Reconciliados: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('reconciliados').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ), */
            Text(
              "INFORME FINANCIERO",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Text(
                  'Diezmo: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('diezmo').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
                Text(
                  'Ofrenda: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('ofrenda').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Text(
                  'Total: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('total').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              "REPORTE DE ACTIVIDADES",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Text(
                  'Misión Amigo: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('mamigo').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
                Text(
                  'Consolidación: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('consolidacion').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Text(
                  'Discipulado 1: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('discipulado').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
                Text(
                  'Hermanos: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('hermanos').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              "MISIÓN AMIGO",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Text(
                  'Amigos: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('amigos1').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
                Text(
                  'Niños: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('ninos1').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Text(
                  'V.E.A: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('vea').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
                Text(
                  'Escuela: ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    form.getData('escuela').toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff878787),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              'Amigo:',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              form.getData('amigo1'),
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
              form.getData('direccion1'),
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
              form.getData('telefono1'),
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff878787),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Amigo:',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              form.getData('amigo2'),
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
              form.getData('direccion2'),
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
              form.getData('telefono2'),
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff878787),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Amigo:',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              form.getData('amigo3'),
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
              form.getData('direccion3'),
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
              form.getData('telefono3'),
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff878787),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              "OBSERVACIONES",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              form.getData('actualizaciones').replaceAll(RegExp(r"\[|\]"), ''),
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff878787),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
