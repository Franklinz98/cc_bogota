import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/screens/views/admin/credentials.dart';
import 'package:cc_bogota/screens/views/admin/events.dart';
import 'package:cc_bogota/screens/views/admin/know.dart';
import 'package:cc_bogota/screens/views/admin/redirection.dart';
import 'package:cc_bogota/screens/views/admin/school.dart';
import 'package:cc_bogota/screens/views/admin/views.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/admin/pfi.dart';

class AdminRoute extends StatefulWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  _RouteState createState() => _RouteState();
}

class _RouteState extends State<AdminRoute> {
  Widget _content;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    _updateViews();
    return Scaffold(
        key: widget._scaffoldKey,
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: _content,
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: AppColors.shark,
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.line_style_rounded),
                label: 'PFI',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school_outlined),
                label: 'Escuela',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: 'Conocer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined),
                label: 'Eventos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.view_carousel_outlined),
                label: 'Vistas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.link_outlined),
                label: 'Redirección',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle_outlined),
                label: 'Usuarios',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            selectedItemColor: AppColors.maize,
            unselectedItemColor: Colors.grey[400],
            unselectedLabelStyle:
                GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 12),
            selectedLabelStyle:
                GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 14),
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _updateViews() {
    switch (_currentIndex) {
      case 0:
        _content = PfiList();
        break;
      case 1:
        _content = RequestList();
        break;
      case 2:
        _content = KnowList();
        break;
      case 3:
        _content = PostEvent();
        break;
      case 4:
        _content = ViewUpdate();
        break;
      case 5:
        _content = Redirect();
        break;
      case 6:
        _content = CredentialsManagement();
        break;
      default:
        _content = Center(
          child: Text(
            'Content',
            style: TextStyle(color: Colors.white),
          ),
        );
    }
  }
}
