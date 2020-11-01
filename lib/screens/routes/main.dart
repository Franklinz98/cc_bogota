import 'package:cc_bogota/backend/authentication.dart';
import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/models/cc_user.dart';
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
  Widget content;
  CCAppBar ccAppBar;
  Function _adminFunction;

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
    content = Main(
      locationFunction: () {
        setState(() {
          content = CCLocations();
          setTitle(title: "Encuentranos");
        });
      },
      switchContent: this.switchContent,
    );
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
    return Scaffold(
      key: widget._scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: content,
            ),
            ccAppBar,
          ],
        ),
      ),
      drawer: CCDrawer(
        scaffoldKey: widget._scaffoldKey,
        onStart: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          setState(() {
            content = Main(
              locationFunction: () {
                setState(() {
                  content = CCLocations();
                  setTitle(title: "Encuentranos");
                });
              },
              switchContent: this.switchContent,
            );
            setTitle();
          });
        },
        onMedia: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          setState(() {
            content = Multimedia(
              switchContent: this.switchContent,
            );
            setTitle(title: "Multimedia");
          });
        },
        onMinistries: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          setState(() {
            content = Ministries(
              switchContent: this.switchContent,
            );
            setTitle(title: "Ministerios");
          });
        },
        onDonations: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          setState(() {
            content = CCDetails(
                content: DonationDetails(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac magna in mi faucibus efficitur et eget nibh. Suspendisse tincidunt at ligula sed facilisis. Phasellus enim quam, aliquam id lectus vitae, malesuada pellentesque tellus. Aliquam et nibh magna. Vivamus semper viverra quam a eleifend. Sed id ligula sit amet ligula sagittis faucibus. Morbi accumsan aliquet felis non euismod. Nunc eu aliquam lorem. Etiam posuere est ornare tellus gravida, sit amet auctor nisl finibus. Praesent id venenatis nulla, quis facilisis urna. Cras pellentesque neque in quam lobortis, eget lobortis mauris faucibus. Vestibulum aliquet ullamcorper lacinia. Etiam blandit efficitur placerat. Etiam pulvinar, nunc ac maximus rhoncus, orci lacus rhoncus urna, nec scelerisque felis metus a eros. Duis condimentum consectetur ultricies.",
                ),
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/headers%2Fdonations.png?alt=media&token=4ea789f3-dc2a-4c0b-b04a-efaf6bcf8556");
            setTitle(title: "SIEMBRA EN EL MINISTERIO");
          });
        },
        onKnowYou: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          setState(() {
            content = CCDetails(
              content: SchoolReg(
                onFinish: () {
                  setState(() {
                    content = Main(
                      locationFunction: () {
                        setState(() {
                          content = CCLocations();
                          setTitle(title: "Encuentranos");
                        });
                      },
                      switchContent: this.switchContent,
                    );
                    setTitle();
                  });
                },
              ),
              imageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/headers%2Fdonations.png?alt=media&token=4ea789f3-dc2a-4c0b-b04a-efaf6bcf8556",
            );
            setTitle(title: "INSCRIPCIÓN");
          });
        },
        onContact: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          setState(() {
            content = CCDetails(
                content: ContactUs(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac magna in mi faucibus efficitur et eget nibh. Suspendisse tincidunt at ligula sed facilisis. Phasellus enim quam, aliquam id lectus vitae, malesuada pellentesque tellus. Aliquam et nibh magna. Vivamus semper viverra quam a eleifend. Sed id ligula sit amet ligula sagittis faucibus. Morbi accumsan aliquet felis non euismod. Nunc eu aliquam lorem. Etiam posuere est ornare tellus gravida, sit amet auctor nisl finibus. Praesent id venenatis nulla, quis facilisis urna. Cras pellentesque neque in quam lobortis, eget lobortis mauris faucibus. Vestibulum aliquet ullamcorper lacinia. Etiam blandit efficitur placerat. Etiam pulvinar, nunc ac maximus rhoncus, orci lacus rhoncus urna, nec scelerisque felis metus a eros. Duis condimentum consectetur ultricies.",
                ),
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/headers%2Fcontact_us.png?alt=media&token=b2060697-0edd-427c-9699-433cec13feb2");
            setTitle(title: "CONTACTANOS");
          });
        },
        onPFI: () {
          widget._scaffoldKey.currentState.openEndDrawer();
          if (Provider.of<CCState>(context, listen: false).userClearance ==
              AuthType.leader) {
            setState(() {
              content = PFIForm(
                onReportSent: () {
                  setState(() {
                    content = Main(
                      locationFunction: () {
                        setState(() {
                          content = CCLocations();
                          setTitle(title: "Encuentranos");
                        });
                      },
                      switchContent: this.switchContent,
                    );
                    setTitle();
                  });
                },
              );
              setTitle(title: "INFORME SEMANAL");
            });
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

  switchContent(Widget widget, {String title}) {
    setState(() {
      content = widget;
      setTitle(title: title);
    });
  }
}
