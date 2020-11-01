import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/components/ministry_banner.dart';
import 'package:cc_bogota/components/details_view.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/screens/routes/main.dart';
import 'package:cc_bogota/screens/views/main/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ministries extends StatelessWidget {
  final Function switchContent;

  const Ministries({
    Key key,
    @required this.switchContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 56.0,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: MinistryBanner(
                    title: "Mujeres Determinantes",
                    url:
                        "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/ministries%2Fdeterminantes.png?alt=media&token=217bfbd9-f830-4b5c-b8aa-0bdc6ab9b903",
                    switchContent: this.switchContent,
                  ),
                ),
                SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  child: MinistryBanner(
                    title: "Emprendedores de Reino",
                    url:
                        "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/ministries%2Femprendedores.png?alt=media&token=c6760886-6dc6-44e7-9390-0ece59188451",
                    switchContent: this.switchContent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: MinistryBanner(
                    title: "R21",
                    url:
                        "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/ministries%2Fr21.png?alt=media&token=8bbc059b-13fa-4410-895e-77c81a8a4964",
                    switchContent: this.switchContent,
                  ),
                ),
                SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  child: MinistryBanner(
                    title: "IgleKids",
                    url:
                        "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/ministries%2Figlekids.png?alt=media&token=a5f80e01-0f6a-4554-ade9-38c40cbb3db6",
                    switchContent: this.switchContent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
