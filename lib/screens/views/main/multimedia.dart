import 'package:cc_bogota/components/ministry_banner.dart';
import 'package:cc_bogota/models/view.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:flutter/material.dart';
import 'package:cc_bogota/backend/requets.dart';

class Multimedia extends StatelessWidget {
  final CCState appState;

  const Multimedia({
    Key key,
    @required this.appState,
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
            child: FutureBuilder<ViewData>(
              future: getViewData('pictures'),
              builder:
                  (BuildContext context, AsyncSnapshot<ViewData> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return MinistryBanner(
                      title: "Fotos",
                      url: snapshot.data.cover,
                      onTap: () {},
                    );
                  } else if (snapshot.hasError) {
                    Text('error');
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Expanded(
            child: FutureBuilder<ViewData>(
              future: getViewData('video'),
              builder:
                  (BuildContext context, AsyncSnapshot<ViewData> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return MinistryBanner(
                      title: "Videos",
                      url: snapshot.data.cover,
                      onTap: () {},
                    );
                  } else if (snapshot.hasError) {
                    Text('error');
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
