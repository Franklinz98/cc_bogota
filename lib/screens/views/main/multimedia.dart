import 'package:cc_bogota/components/ministry_banner.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/models/viewData.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:flutter/material.dart';
import 'package:cc_bogota/backend/requets.dart';
import 'package:url_launcher/url_launcher.dart';

class Multimedia extends StatelessWidget {
  final CCState appState;

  const Multimedia({
    Key key,
    @required this.appState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        this.appState.updateContentScreen(ContentScreen.home);
        return false;
      },
      child: Padding(
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
                        onTap: () async {
                          final url = appState.redirect['pictures'];
                          if (await canLaunch(url))
                            launch(url);
                          else
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text("No se puede redireccionar"),
                              ),
                            );
                        },
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
                        onTap: () async {
                          final url = appState.redirect['videos'];
                          if (await canLaunch(url))
                            launch(url);
                          else
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text("No se puede redireccionar"),
                              ),
                            );
                        },
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
      ),
    );
  }
}
