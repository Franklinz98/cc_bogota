import 'package:cached_network_image/cached_network_image.dart';
import 'package:cc_bogota/components/details_view.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/screens/views/main/details.dart';
import 'package:cc_bogota/screens/views/main/ministries.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MinistryBanner extends StatelessWidget {
  final String title;
  final String url;
  final Function switchContent;

  const MinistryBanner(
      {Key key,
      @required this.title,
      @required this.url,
      @required this.switchContent})
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
      onTap: () {
        this.switchContent.call(
            CCDetails(
              content: DetailsView(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac magna in mi faucibus efficitur et eget nibh. Suspendisse tincidunt at ligula sed facilisis. Phasellus enim quam, aliquam id lectus vitae, malesuada pellentesque tellus. Aliquam et nibh magna. Vivamus semper viverra quam a eleifend. Sed id ligula sit amet ligula sagittis faucibus. Morbi accumsan aliquet felis non euismod. Nunc eu aliquam lorem. Etiam posuere est ornare tellus gravida, sit amet auctor nisl finibus. Praesent id venenatis nulla, quis facilisis urna. Cras pellentesque neque in quam lobortis, eget lobortis mauris faucibus. Vestibulum aliquet ullamcorper lacinia. Etiam blandit efficitur placerat. Etiam pulvinar, nunc ac maximus rhoncus, orci lacus rhoncus urna, nec scelerisque felis metus a eros. Duis condimentum consectetur ultricies.",
                onBackPressed: () {
                  this.switchContent.call(
                      Ministries(switchContent: this.switchContent),
                      title: "MINISTERIOS");
                },
              ),
              imageUrl: this.url,
            ),
            title: this.title);
      },
    );
  }
}
