import 'package:cached_network_image/cached_network_image.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MinistryBanner extends StatelessWidget {
  final String title;
  final String url;
  final Function onTap;

  const MinistryBanner(
      {Key key, @required this.title, @required this.url, @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.shark,
                borderRadius: BorderRadius.circular(8.00),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  imageUrl: url,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white),
            ),
          )
        ],
      ),
      onTap: () => this.onTap(),
    );
  }
}
