import 'package:cached_network_image/cached_network_image.dart';
import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/models/viewData.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/widgets/events_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Main extends StatefulWidget {
  final CCState appState;

  const Main({
    Key key,
    @required this.appState,
  }) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  /* Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set();
  GoogleMapController mapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(4.654628, -74.152657),
    zoom: 16,
  );

  String _darkMapStyle; */

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FutureBuilder<ViewData>(
          future: getViewData('home'),
          builder: (BuildContext context, AsyncSnapshot<ViewData> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final List imageList = snapshot.data.carroussel;
                return GFCarousel(
                  items: imageList.map(
                    (url) {
                      return Container(
                        color: AppColors.shark,
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          imageUrl: url,
                          fit: BoxFit.cover,
                          width: 1000.0,
                        ),
                      );
                    },
                  ).toList(),
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 6),
                  pagination: true,
                  passiveIndicator: Color(0xff707070),
                  activeIndicator: Colors.white,
                  pagerSize: 6.0,
                  height: 220.0,
                );
              } else if (snapshot.hasError) {
                Text('error');
              }
            }
            return SizedBox(
              width: 1000,
              height: 220,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "SOBRE NOSOTROS",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: FutureBuilder<ViewData>(
                    future: getViewData('aboutUs'),
                    builder: (BuildContext context,
                        AsyncSnapshot<ViewData> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.shark,
                                  borderRadius: BorderRadius.circular(8.00),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    imageUrl: snapshot.data.cover,
                                    fit: BoxFit.cover,
                                    width: 1000.0,
                                  ),
                                ),
                              ),
                              onTap: () {
                                widget.appState.updateViewdata(snapshot.data);
                                widget.appState
                                    .updateContentView(ContentViews.our_vision);
                              });
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
                  width: 12.0,
                ),
                Expanded(
                  child: FutureBuilder<ViewData>(
                    future: getViewData('history'),
                    builder: (BuildContext context,
                        AsyncSnapshot<ViewData> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.shark,
                                  borderRadius: BorderRadius.circular(8.00),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    imageUrl: snapshot.data.cover,
                                    fit: BoxFit.cover,
                                    width: 1000.0,
                                  ),
                                ),
                              ),
                              onTap: () {
                                widget.appState.updateViewdata(snapshot.data);
                                widget.appState.updateContentView(
                                    ContentViews.our_history);
                              });
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
        ),
        SizedBox(
          height: 6.0,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "PRÓXIMOS EVENTOS",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: EventBar(),
        ),
        SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Text(
            "CONÓCENOS",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                child: Image.asset(
                  'assets/images/facebook_button.png',
                  height: 42.0,
                ),
                onTap: () async {
                  final url = widget.appState.redirect['facebook'];
                  if (await canLaunch(url))
                    launch(url);
                  else
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("No se puede redireccionar"),
                      ),
                    );
                },
              ),
              GestureDetector(
                child: Image.asset(
                  'assets/images/instagram_button.png',
                  height: 42.0,
                ),
                onTap: () async {
                  final url = widget.appState.redirect['instagram'];
                  if (await canLaunch(url))
                    launch(url);
                  else
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("No se puede redireccionar"),
                      ),
                    );
                },
              ),
              GestureDetector(
                child: Image.asset(
                  'assets/images/youtube_button.png',
                  height: 42.0,
                ),
                onTap: () async {
                  final url = widget.appState.redirect['youtube'];
                  if (await canLaunch(url))
                    launch(url);
                  else
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("No se puede redireccionar"),
                      ),
                    );
                },
              ),
              GestureDetector(
                child: Image.asset(
                  'assets/images/cc_button.png',
                  height: 42.0,
                ),
                onTap: () async {
                  final url = widget.appState.redirect['website'];
                  if (await canLaunch(url))
                    launch(url);
                  else
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("No se puede redireccionar"),
                      ),
                    );
                },
              ),
              GestureDetector(
                child: Image.asset(
                  'assets/images/cc_location.png',
                  height: 42.0,
                ),
                onTap: () =>
                    widget.appState.updateContentView(ContentViews.location),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.0,
        )
      ],
    );
  }
}
