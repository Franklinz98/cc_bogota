import 'package:cc_bogota/backend/authentication.dart';
import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/components/details_view.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/screens/routes/admin.dart';
import 'package:cc_bogota/screens/routes/authentication.dart';
import 'package:cc_bogota/screens/views/main/multimedia.dart';
import 'package:cc_bogota/screens/views/main/school.dart';
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
        String jwtToken = await firebaseUser.getIdToken();
        Provider.of<CCState>(context, listen: false)
            .updateToken(token: jwtToken);
        getClearance(firebaseUser.uid, jwtToken).then((clearance) =>
            Provider.of<CCState>(context, listen: false)
                .updateClearanceLevel(clearance: clearance));
      }
    });
    initializeDateFormatting('es_CO', null);
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
        onDonations: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.donations);
        },
        onKnowYou: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          _appState.updateContentScreen(ContentScreen.school);
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
      case ContentScreen.pfi:
        setTitle(title: "INFORME SEMANAL");
        return PFIForm(
          appState: _appState,
          onReportSent: () {
            _appState.updateContentScreen(ContentScreen.home);
          },
        );
        break;
      case ContentScreen.donations:
        setTitle(title: "SIEMBRA EN EL MINISTERIO");
        return CCDetails(
            content: DonationDetails(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac magna in mi faucibus efficitur et eget nibh. Suspendisse tincidunt at ligula sed facilisis. Phasellus enim quam, aliquam id lectus vitae, malesuada pellentesque tellus. Aliquam et nibh magna. Vivamus semper viverra quam a eleifend. Sed id ligula sit amet ligula sagittis faucibus. Morbi accumsan aliquet felis non euismod. Nunc eu aliquam lorem. Etiam posuere est ornare tellus gravida, sit amet auctor nisl finibus. Praesent id venenatis nulla, quis facilisis urna. Cras pellentesque neque in quam lobortis, eget lobortis mauris faucibus. Vestibulum aliquet ullamcorper lacinia. Etiam blandit efficitur placerat. Etiam pulvinar, nunc ac maximus rhoncus, orci lacus rhoncus urna, nec scelerisque felis metus a eros. Duis condimentum consectetur ultricies.",
            ),
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/headers%2Fdonations.png?alt=media&token=4ea789f3-dc2a-4c0b-b04a-efaf6bcf8556");
        break;
      case ContentScreen.school:
        setTitle(title: "INSCRIPCIÓN");
        return CCDetails(
          content: SchoolReg(
            onFinish: () {
              _appState.updateContentScreen(ContentScreen.home);
            },
          ),
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/headers%2Fdonations.png?alt=media&token=4ea789f3-dc2a-4c0b-b04a-efaf6bcf8556",
        );
        break;
      case ContentScreen.contact:
        setTitle(title: "CONTACTANOS");
        return CCDetails(
            content: ContactUs(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac magna in mi faucibus efficitur et eget nibh. Suspendisse tincidunt at ligula sed facilisis. Phasellus enim quam, aliquam id lectus vitae, malesuada pellentesque tellus. Aliquam et nibh magna. Vivamus semper viverra quam a eleifend. Sed id ligula sit amet ligula sagittis faucibus. Morbi accumsan aliquet felis non euismod. Nunc eu aliquam lorem. Etiam posuere est ornare tellus gravida, sit amet auctor nisl finibus. Praesent id venenatis nulla, quis facilisis urna. Cras pellentesque neque in quam lobortis, eget lobortis mauris faucibus. Vestibulum aliquet ullamcorper lacinia. Etiam blandit efficitur placerat. Etiam pulvinar, nunc ac maximus rhoncus, orci lacus rhoncus urna, nec scelerisque felis metus a eros. Duis condimentum consectetur ultricies.",
            ),
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/headers%2Fcontact_us.png?alt=media&token=b2060697-0edd-427c-9699-433cec13feb2");
        break;

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
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac magna in mi faucibus efficitur et eget nibh. Suspendisse tincidunt at ligula sed facilisis. Phasellus enim quam, aliquam id lectus vitae, malesuada pellentesque tellus. Aliquam et nibh magna. Vivamus semper viverra quam a eleifend. Sed id ligula sit amet ligula sagittis faucibus. Morbi accumsan aliquet felis non euismod. Nunc eu aliquam lorem. Etiam posuere est ornare tellus gravida, sit amet auctor nisl finibus. Praesent id venenatis nulla, quis facilisis urna. Cras pellentesque neque in quam lobortis, eget lobortis mauris faucibus. Vestibulum aliquet ullamcorper lacinia. Etiam blandit efficitur placerat. Etiam pulvinar, nunc ac maximus rhoncus, orci lacus rhoncus urna, nec scelerisque felis metus a eros. Duis condimentum consectetur ultricies.",
            onBackPressed: () {
              _appState.updateContentScreen(ContentScreen.home);
            },
          ),
          imageUrl: "https://www.sanic.org/2017/images/vision.jpg",
        );
        break;
      case ContentViews.our_history:
        setTitle(title: "NUESTRA HISTORIA");
        return CCDetails(
          content: DetailsView(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac magna in mi faucibus efficitur et eget nibh. Suspendisse tincidunt at ligula sed facilisis. Phasellus enim quam, aliquam id lectus vitae, malesuada pellentesque tellus. Aliquam et nibh magna. Vivamus semper viverra quam a eleifend. Sed id ligula sit amet ligula sagittis faucibus. Morbi accumsan aliquet felis non euismod. Nunc eu aliquam lorem. Etiam posuere est ornare tellus gravida, sit amet auctor nisl finibus. Praesent id venenatis nulla, quis facilisis urna. Cras pellentesque neque in quam lobortis, eget lobortis mauris faucibus. Vestibulum aliquet ullamcorper lacinia. Etiam blandit efficitur placerat. Etiam pulvinar, nunc ac maximus rhoncus, orci lacus rhoncus urna, nec scelerisque felis metus a eros. Duis condimentum consectetur ultricies.",
            onBackPressed: () {
              _appState.updateContentScreen(ContentScreen.home);
            },
          ),
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/unnamed.jpg?alt=media&token=484f47f7-7f89-45b7-8355-79ec3a02a2ac",
        );
        break;
      case ContentViews.location:
        setTitle(title: "Encuentranos");
        return CCLocations();
        break;
      case ContentViews.womens:
        setTitle(title: "Mujeres Determinantes");
        return CCDetails(
          content: DetailsView(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac magna in mi faucibus efficitur et eget nibh. Suspendisse tincidunt at ligula sed facilisis. Phasellus enim quam, aliquam id lectus vitae, malesuada pellentesque tellus. Aliquam et nibh magna. Vivamus semper viverra quam a eleifend. Sed id ligula sit amet ligula sagittis faucibus. Morbi accumsan aliquet felis non euismod. Nunc eu aliquam lorem. Etiam posuere est ornare tellus gravida, sit amet auctor nisl finibus. Praesent id venenatis nulla, quis facilisis urna. Cras pellentesque neque in quam lobortis, eget lobortis mauris faucibus. Vestibulum aliquet ullamcorper lacinia. Etiam blandit efficitur placerat. Etiam pulvinar, nunc ac maximus rhoncus, orci lacus rhoncus urna, nec scelerisque felis metus a eros. Duis condimentum consectetur ultricies.",
            onBackPressed: () =>
                _appState.updateContentScreen(ContentScreen.ministries),
          ),
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/ministries%2Fdeterminantes.png?alt=media&token=217bfbd9-f830-4b5c-b8aa-0bdc6ab9b903',
        );
        break;
      case ContentViews.entrepenours:
        setTitle(title: "Emprendedores de Reino");
        return CCDetails(
          content: DetailsView(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac magna in mi faucibus efficitur et eget nibh. Suspendisse tincidunt at ligula sed facilisis. Phasellus enim quam, aliquam id lectus vitae, malesuada pellentesque tellus. Aliquam et nibh magna. Vivamus semper viverra quam a eleifend. Sed id ligula sit amet ligula sagittis faucibus. Morbi accumsan aliquet felis non euismod. Nunc eu aliquam lorem. Etiam posuere est ornare tellus gravida, sit amet auctor nisl finibus. Praesent id venenatis nulla, quis facilisis urna. Cras pellentesque neque in quam lobortis, eget lobortis mauris faucibus. Vestibulum aliquet ullamcorper lacinia. Etiam blandit efficitur placerat. Etiam pulvinar, nunc ac maximus rhoncus, orci lacus rhoncus urna, nec scelerisque felis metus a eros. Duis condimentum consectetur ultricies.",
            onBackPressed: () =>
                _appState.updateContentScreen(ContentScreen.ministries),
          ),
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/ministries%2Femprendedores.png?alt=media&token=c6760886-6dc6-44e7-9390-0ece59188451',
        );
        break;
      case ContentViews.kids:
        setTitle(title: "IgleKids");
        return CCDetails(
          content: DetailsView(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac magna in mi faucibus efficitur et eget nibh. Suspendisse tincidunt at ligula sed facilisis. Phasellus enim quam, aliquam id lectus vitae, malesuada pellentesque tellus. Aliquam et nibh magna. Vivamus semper viverra quam a eleifend. Sed id ligula sit amet ligula sagittis faucibus. Morbi accumsan aliquet felis non euismod. Nunc eu aliquam lorem. Etiam posuere est ornare tellus gravida, sit amet auctor nisl finibus. Praesent id venenatis nulla, quis facilisis urna. Cras pellentesque neque in quam lobortis, eget lobortis mauris faucibus. Vestibulum aliquet ullamcorper lacinia. Etiam blandit efficitur placerat. Etiam pulvinar, nunc ac maximus rhoncus, orci lacus rhoncus urna, nec scelerisque felis metus a eros. Duis condimentum consectetur ultricies.",
            onBackPressed: () =>
                _appState.updateContentScreen(ContentScreen.ministries),
          ),
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/ministries%2Figlekids.png?alt=media&token=a5f80e01-0f6a-4554-ade9-38c40cbb3db6',
        );
        break;
      case ContentViews.r21:
        setTitle(title: "R21");
        return CCDetails(
          content: DetailsView(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac magna in mi faucibus efficitur et eget nibh. Suspendisse tincidunt at ligula sed facilisis. Phasellus enim quam, aliquam id lectus vitae, malesuada pellentesque tellus. Aliquam et nibh magna. Vivamus semper viverra quam a eleifend. Sed id ligula sit amet ligula sagittis faucibus. Morbi accumsan aliquet felis non euismod. Nunc eu aliquam lorem. Etiam posuere est ornare tellus gravida, sit amet auctor nisl finibus. Praesent id venenatis nulla, quis facilisis urna. Cras pellentesque neque in quam lobortis, eget lobortis mauris faucibus. Vestibulum aliquet ullamcorper lacinia. Etiam blandit efficitur placerat. Etiam pulvinar, nunc ac maximus rhoncus, orci lacus rhoncus urna, nec scelerisque felis metus a eros. Duis condimentum consectetur ultricies.",
            onBackPressed: () =>
                _appState.updateContentScreen(ContentScreen.ministries),
          ),
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/ministries%2Fr21.png?alt=media&token=8bbc059b-13fa-4410-895e-77c81a8a4964',
        );
        break;
    }
  }
}
