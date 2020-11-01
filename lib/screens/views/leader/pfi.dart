import 'package:cc_bogota/backend/authentication.dart';
import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/components/gradient_image.dart';
import 'package:cc_bogota/components/pfi_a.dart';
import 'package:cc_bogota/components/pfi_b.dart';
import 'package:cc_bogota/components/pfi_c.dart';
import 'package:flutter/material.dart';

class PFIForm extends StatefulWidget {
  final Function onReportSent;

  PFIForm({Key key, @required this.onReportSent}) : super(key: key);

  @override
  _PFIFormState createState() => _PFIFormState();
  final _formKeyA = GlobalKey<FormState>();
  final _formKeyB = GlobalKey<FormState>();
  final Map<String, dynamic> form = Map();
}

class _PFIFormState extends State<PFIForm> {
  Widget _content;
  FormA _formA;
  FormB _formB;
  FormC _formC;

  @override
  void initState() {
    super.initState();
    _formA = FormA(
      formKey: widget._formKeyA,
      onFinish: (Map<String, dynamic> map) {
        widget.form.addAll(map);
        setState(() {
          _content = _formB;
        });
      },
    );
    _formB = FormB(
      formKey: widget._formKeyB,
      onFinish: (Map<String, dynamic> map) {
        widget.form.addAll(map);
        setState(() {
          _content = _formC;
        });
      },
    );
    _formC = FormC(
      formKey: widget._formKeyB,
      onFinish: (Map<String, dynamic> map) {
        widget.form.addAll(map);
        //TODO token from provider
        /* signIn('ccporelmundo20@gmail.com', 'qwerty123')
            .then((token) => sentReport(widget.form, token).then((value) {
                  widget.onReportSent.call();
                })); */
      },
    );
    _content = _formA;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GradientImage(
            imageUrl:
                "https://images.pexels.com/photos/669615/pexels-photo-669615.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: _content,
            ),
          ),
        ),
      ],
    );
  }
}
