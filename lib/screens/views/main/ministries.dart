import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/models/view.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/components/ministry_banner.dart';
import 'package:cc_bogota/backend/requets.dart';
import 'package:flutter/material.dart';

class Ministries extends StatelessWidget {
  final CCState appState;

  const Ministries({
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: FutureBuilder<ViewData>(
                    future: getViewData('women'),
                    builder: (BuildContext context,
                        AsyncSnapshot<ViewData> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return MinistryBanner(
                            title: "Mujeres Determinantes",
                            url: snapshot.data.cover,
                            onTap: () {
                              appState.updateViewdata(snapshot.data);
                              appState.updateContentView(ContentViews.womens);
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
                  width: 24.0,
                ),
                Expanded(
                  child: FutureBuilder<ViewData>(
                    future: getViewData('entrepenour'),
                    builder: (BuildContext context,
                        AsyncSnapshot<ViewData> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return MinistryBanner(
                            title: "Emprendedores de Reino",
                            url: snapshot.data.cover,
                            onTap: () {
                              appState.updateViewdata(snapshot.data);
                              appState
                                  .updateContentView(ContentViews.entrepenours);
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
          SizedBox(
            height: 24.0,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: FutureBuilder<ViewData>(
                    future: getViewData('r21'),
                    builder: (BuildContext context,
                        AsyncSnapshot<ViewData> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return MinistryBanner(
                            title: "R21",
                            url: snapshot.data.cover,
                            onTap: () {
                              appState.updateViewdata(snapshot.data);
                              appState.updateContentView(ContentViews.r21);
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
                  width: 24.0,
                ),
                Expanded(
                  child: FutureBuilder<ViewData>(
                    future: getViewData('iglekids'),
                    builder: (BuildContext context,
                        AsyncSnapshot<ViewData> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return MinistryBanner(
                            title: "IgleKids",
                            url: snapshot.data.cover,
                            onTap: () {
                              appState.updateViewdata(snapshot.data);
                              appState.updateContentView(ContentViews.kids);
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
        ],
      ),
    );
  }
}
