import 'package:cc_bogota/components/gradient_image.dart';
import 'package:cc_bogota/components/pfi_a.dart';
import 'package:cc_bogota/components/pfi_b.dart';
import 'package:cc_bogota/components/pfi_c.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:flutter/material.dart';

import '../../../backend/requets.dart';
import '../../../provider/cc_state.dart';

class PFIForm extends StatefulWidget {
  final Function onReportSent;
  final CCState appState;

  PFIForm({Key key, @required this.appState, @required this.onReportSent})
      : super(key: key);

  @override
  _PFIFormState createState() => _PFIFormState();
  final _formKeyA = GlobalKey<FormState>();
  final _formKeyB = GlobalKey<FormState>();
  final Map<String, dynamic> form = Map();
}

class _PFIFormState extends State<PFIForm> {
  PfiScreen _content;
  FormA _formA;
  FormB _formB;
  FormC _formC;

  @override
  void initState() {
    super.initState();
    _content = PfiScreen.a;
    _formA = FormA(
      formKey: widget._formKeyA,
      onFinish: (Map<String, dynamic> map) {
        widget.form.addAll(map);
        setState(() {
          _content = PfiScreen.b;
        });
      },
    );
    _formB = FormB(
      formKey: widget._formKeyB,
      onFinish: (Map<String, dynamic> map) {
        widget.form.addAll(map);
        setState(() {
          _content = PfiScreen.c;
        });
      },
    );
    _formC = FormC(
      formKey: widget._formKeyB,
      onFinish: (Map<String, dynamic> map) {
        widget.form.addAll(map);
        sentReport(widget.form, widget.appState.authToken).then((value) {
          widget.onReportSent.call();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.appState.updateContentScreen(ContentScreen.home);
        return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GradientImage(imageUrl: widget.appState.viewData.cover),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: _getScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getScreen() {
    switch (_content) {
      case PfiScreen.a:
        return _formA;
      case PfiScreen.b:
        return _formB;
      default:
        return _formC;
    }
  }
}
