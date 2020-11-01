import 'package:cc_bogota/components/ministry_banner.dart';
import 'package:flutter/material.dart';

class Multimedia extends StatelessWidget {
  final Function switchContent;

  const Multimedia({
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
            child: MinistryBanner(
              title: "Fotos",
              url:
                  "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/ministries%2Fdeterminantes.png?alt=media&token=217bfbd9-f830-4b5c-b8aa-0bdc6ab9b903",
              switchContent: this.switchContent,
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Expanded(
            child: MinistryBanner(
              title: "Videos",
              url:
                  "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/ministries%2Fr21.png?alt=media&token=8bbc059b-13fa-4410-895e-77c81a8a4964",
              switchContent: this.switchContent,
            ),
          ),
        ],
      ),
    );
  }
}
