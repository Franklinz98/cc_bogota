import 'package:cc_bogota/components/contact_us.dart';
import 'package:cc_bogota/components/details_view.dart';
import 'package:cc_bogota/components/donations_details.dart';
import 'package:cc_bogota/components/gradient_image.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:flutter/material.dart';

class CCDetails extends StatelessWidget {
  final CCState appState;
  final content;

  const CCDetails({Key key, @required this.appState, @required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    updateText(appState.viewData.text);
    WillPopCallback popCallback;
    if (this.appState.view == ContentViews.entrepenours ||
        this.appState.view == ContentViews.kids ||
        this.appState.view == ContentViews.r21 ||
        this.appState.view == ContentViews.womens) {
      popCallback = () async {
        this.appState.updateContentScreen(ContentScreen.ministries);
        return false;
      };
    } else {
      popCallback = () async {
        this.appState.updateContentScreen(ContentScreen.home);
        return false;
      };
    }
    return WillPopScope(
      onWillPop: popCallback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GradientImage(imageUrl: this.appState.viewData.cover),
          SizedBox(
            height: 16.0,
          ),
          SingleChildScrollView(
            child: this.content,
          ),
        ],
      ),
    );
  }

  void updateText(String text) {
    switch (content.runtimeType) {
      case DonationDetails:
        content.updateText(text);
        break;
      case ContactUs:
        content.updateText(text);
        break;
      case DetailsView:
        content.updateText(text);
        break;
    }
  }
}
