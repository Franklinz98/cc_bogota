import 'package:cached_network_image/cached_network_image.dart';
import 'package:cc_bogota/components/details_view.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/screens/views/main/details.dart';
import 'package:cc_bogota/widgets/event_card.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cc_bogota/models/event.dart';
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

  final List<String> imageList = [
    "https://images.pexels.com/photos/1666816/pexels-photo-1666816.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/976866/pexels-photo-976866.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/2351719/pexels-photo-2351719.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/2014775/pexels-photo-2014775.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/2147029/pexels-photo-2147029.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GFCarousel(
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
                  child: GestureDetector(
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
                          imageUrl:
                              "https://www.sanic.org/2017/images/vision.jpg",
                          fit: BoxFit.cover,
                          width: 1000.0,
                        ),
                      ),
                    ),
                    onTap: () => widget.appState
                        .updateContentView(ContentViews.our_vision),
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: GestureDetector(
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
                          imageUrl:
                              "https://firebasestorage.googleapis.com/v0/b/cc-bogota.appspot.com/o/unnamed.jpg?alt=media&token=484f47f7-7f89-45b7-8355-79ec3a02a2ac",
                          fit: BoxFit.cover,
                          width: 1000.0,
                        ),
                      ),
                    ),
                    onTap: () => widget.appState
                        .updateContentView(ContentViews.our_history),
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
          child: Row(
            children: <Widget>[
              EventCard(
                event: CCEvent(
                  title: "Reunión - Liberación y Guerra Espiritual",
                  dateTime: DateTime.parse("2020-06-28 19:00:00"),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              EventCard(
                event: CCEvent(
                  title: "Reunión - Familias con Propósito",
                  dateTime: DateTime.parse("2020-06-29 19:00:00"),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              EventCard(
                event: CCEvent(
                  title: "Reunión - F.A.M.A",
                  dateTime: DateTime.parse("2020-06-30 19:30:00"),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              EventCard(
                event: CCEvent(
                  title: "R21 - Noches de Renovación",
                  dateTime: DateTime.parse("2020-07-01 18:30:00"),
                ),
              ),
            ],
          ),
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
                  const url = "https://www.facebook.com/CCIBogota";
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
                  const url =
                      "https://www.instagram.com/centrocristianobogota/";
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
                  const url =
                      "https://www.youtube.com/channel/UCAUc8XoldDkTGGxH7huK9RA";
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
                  const url = "http://centrocristianobogota2819.epizy.com/?i=1";
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
