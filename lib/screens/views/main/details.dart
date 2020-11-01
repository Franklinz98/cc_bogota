import 'package:cc_bogota/components/gradient_image.dart';
import 'package:flutter/material.dart';

class CCDetails extends StatelessWidget {
  final String imageUrl;
  final Widget content;

  const CCDetails({Key key, @required this.content, @required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GradientImage(imageUrl: this.imageUrl),
        SizedBox(
          height: 16.0,
        ),
        SingleChildScrollView(
          child: this.content,
        ),
      ],
    );
  }
}
