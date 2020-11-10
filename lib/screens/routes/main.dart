import 'package:cc_bogota/backend/authentication.dart';
import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/components/details_view.dart';
import 'package:cc_bogota/models/viewData.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/screens/routes/admin.dart';
import 'package:cc_bogota/screens/routes/authentication.dart';
import 'package:cc_bogota/screens/views/main/know_you.dart';
import 'package:cc_bogota/screens/views/main/multimedia.dart';
import 'package:cc_bogota/screens/views/main/school.dart';
import 'package:cc_bogota/screens/views/policies/privacy_policy.dart';
import 'package:cc_bogota/screens/views/policies/terms_cond.dart';
import 'package:cc_bogota/widgets/appbar.dart';
import 'package:cc_bogota/components/contact_us.dart';
import 'package:cc_bogota/components/donations_details.dart';
import 'package:cc_bogota/widgets/drawer.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/screens/views/main/details.dart';
import 'package:cc_bogota/screens/views/main/locations.dart';
import 'package:cc_bogota/screens/views/main/home.dart';
import 'package:cc_bogota/screens/views/main/ministries.dart';
import 'package:cc_bogota/screens/views/leader/pfi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

class MainRoute extends StatefulWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  _RouteState createState() => _RouteState();
}

class _RouteState extends State<MainRoute> {
  CCAppBar ccAppBar;
  Function _adminFunction;
  CCState _appState;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((value) async {
      User firebaseUser = currentUser();
      if (firebaseUser != null) {
        String jwtToken = await firebaseUser.getIdToken(true);
        Provider.of<CCState>(context, listen: false)
            .updateToken(token: jwtToken);
        getClearance(firebaseUser.uid, jwtToken).then((clearance) =>
            Provider.of<CCState>(context, listen: false)
                .updateClearanceLevel(clearance: clearance));
      }
    });
    initializeDateFormatting('es_CO', null);
    getViewData('redirect').then(
      (value) => Provider.of<CCState>(context, listen: false).updateRedirect(
        value.redirect,
      ),
    );
    // _contentScreen = ContentScreen.home;
    _adminFunction = () {
      if (Provider.of<CCState>(context, listen: false).userClearance ==
          AuthType.admin) {
        var provider = Provider.of<CCState>(context, listen: false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                ChangeNotifierProvider<CCState>.value(
              value: provider,
              child: AdminRoute(),
            ),
          ),
        );
      } else {
        widget._scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text('No estás registrado como Administrador.')));
      }
    };
    ccAppBar = CCAppBar(
      type: AppBarType.start,
      onTapMenu: () {
        widget._scaffoldKey.currentState.openDrawer();
      },
      onTapProfile: _adminFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    /* if (mapController != null) {
      mapController.setMapStyle(_darkMapStyle);
    } */
    _appState ??= Provider.of<CCState>(context);
    return Scaffold(
      key: widget._scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: getScreen(),
            ),
            ccAppBar,
          ],
        ),
      ),
      drawer: CCDrawer(
        scaffoldKey: widget._scaffoldKey,
        onStart: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.home);
        },
        onMedia: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.media);
        },
        onMinistries: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.ministries);
        },
        onPastors: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.pastors);
        },
        onDonations: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.donations);
        },
        onSchool: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.school);
        },
        onKnowYou: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.knowyou);
        },
        onContact: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.contact);
        },
        onPFI: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          if (_appState.userClearance == AuthType.leader) {
            _appState.updateContentScreen(ContentScreen.pfi);
          } else {
            widget._scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('No estás registrado como Felipe Líder.')));
          }
        },
        onPP: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.pp);
        },
        onTC: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.tc);
        },
        onLogin: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AuthenticationRoute(),
            ),
          ).then((user) {
            Provider.of<CCState>(context, listen: false)
                .updateToken(token: user.jwtToken);
            getClearance(user.firebaseID, user.jwtToken).then((clearance) =>
                Provider.of<CCState>(context, listen: false)
                    .updateClearanceLevel(clearance: clearance));
          });
        },
        onLogOff: () {
          signOut().then((value) {
            Provider.of<CCState>(context, listen: false).updateToken();
            Provider.of<CCState>(context, listen: false).updateClearanceLevel();
            _appState.updateContentScreen(ContentScreen.home);
          });
        },
      ),
    );
  }

  setTitle({String title}) {
    if (title == null) {
      ccAppBar = CCAppBar(
        type: AppBarType.start,
        onTapMenu: () {
          widget._scaffoldKey.currentState.openDrawer();
        },
        onTapProfile: _adminFunction,
      );
    } else {
      ccAppBar = CCAppBar(
        type: AppBarType.content,
        title: title,
        onTapMenu: () {
          widget._scaffoldKey.currentState.openDrawer();
        },
        onTapProfile: _adminFunction,
      );
    }
  }

  Widget getScreen() {
    switch (_appState.screen) {
      case ContentScreen.home:
        setTitle();
        return Main(
          appState: _appState,
        );
        break;
      case ContentScreen.media:
        setTitle(title: "Multimedia");
        return Multimedia(
          appState: _appState,
        );
      case ContentScreen.ministries:
        setTitle(title: "Ministerios");
        return Ministries(
          appState: _appState,
        );
        break;
      case ContentScreen.pastors:
        setTitle(title: "NUESTROS PASTORES");
        return getFutureBuilder(
          'pastors',
          CCDetails(
            content: DetailsView(
              onBackPressed: () =>
                  _appState.updateContentScreen(ContentScreen.home),
            ),
            appState: _appState,
          ),
        );
        break;
      case ContentScreen.pfi:
        setTitle(title: "INFORME SEMANAL");
        return getFutureBuilder(
          'pfi',
          PFIForm(
            appState: _appState,
            onReportSent: () {
              _appState.updateContentScreen(ContentScreen.home);
            },
          ),
        );
        break;
      case ContentScreen.donations:
        setTitle(title: "SIEMBRA EN EL MINISTERIO");
        return getFutureBuilder('donations',
            CCDetails(content: DonationDetails(), appState: _appState));

        break;
      case ContentScreen.school:
        setTitle(title: "INSCRIPCIÓN");
        return getFutureBuilder(
          'school',
          CCDetails(
            content: SchoolReg(
              onFinish: () {
                _appState.updateContentScreen(ContentScreen.home);
              },
            ),
            appState: _appState,
          ),
        );
        break;
      case ContentScreen.knowyou:
        setTitle(title: "QUEREMOS CONOCERTE");
        return getFutureBuilder(
          'knowyou',
          CCDetails(
            content: KnowYou(
              onFinish: () {
                _appState.updateContentScreen(ContentScreen.home);
              },
            ),
            appState: _appState,
          ),
        );
        break;
      case ContentScreen.contact:
        setTitle(title: "CONTACTANOS");
        return getFutureBuilder(
          'contact',
          CCDetails(
            content: ContactUs(),
            appState: _appState,
          ),
        );
      case ContentScreen.pp:
        setTitle();
        return PrivacyPolicy(appState: _appState);
      case ContentScreen.tc:
        setTitle();
        return TermsCond(appState: _appState);

      default:
        return getView(_appState.view);
    }
  }

  Widget getView(ContentViews view) {
    switch (view) {
      case ContentViews.our_vision:
        setTitle(title: "NUESTRA VISIÓN");
        return CCDetails(
          content: DetailsView(
            onBackPressed: () {
              _appState.updateContentScreen(ContentScreen.home);
            },
          ),
          appState: _appState,
        );
        break;
      case ContentViews.our_history:
        setTitle(title: "NUESTRA HISTORIA");
        return CCDetails(
          content: DetailsView(
            onBackPressed: () {
              _appState.updateContentScreen(ContentScreen.home);
            },
          ),
          appState: _appState,
        );
        break;
      case ContentViews.location:
        setTitle(title: "Encuentranos");
        return CCLocations(
          appState: _appState,
        );
        break;
      case ContentViews.womens:
        setTitle(title: "Mujeres Determinantes");
        return CCDetails(
          content: DetailsView(
            onBackPressed: () =>
                _appState.updateContentScreen(ContentScreen.ministries),
          ),
          appState: _appState,
        );
        break;
      case ContentViews.entrepenours:
        setTitle(title: "Emprendedores de Reino");
        return CCDetails(
          content: DetailsView(
            onBackPressed: () =>
                _appState.updateContentScreen(ContentScreen.ministries),
          ),
          appState: _appState,
        );
        break;
      case ContentViews.kids:
        setTitle(title: "IgleKids");
        return CCDetails(
          content: DetailsView(
            onBackPressed: () =>
                _appState.updateContentScreen(ContentScreen.ministries),
          ),
          appState: _appState,
        );
        break;
      case ContentViews.r21:
        setTitle(title: "R21");
        return CCDetails(
          content: DetailsView(
            onBackPressed: () =>
                _appState.updateContentScreen(ContentScreen.ministries),
          ),
          appState: _appState,
        );
        break;
    }
  }

  Widget getFutureBuilder(String viewName, Widget content) {
    return FutureBuilder<ViewData>(
      future: getViewData(viewName),
      builder: (BuildContext context, AsyncSnapshot<ViewData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            _appState.updateViewdata(snapshot.data);
            return content;
          } else if (snapshot.hasError) {
            Text('error');
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
