import 'dart:async';
import 'dart:io';

import 'package:cc_bogota/backend/storage.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as p;

class UploadDialog extends StatefulWidget {
  final File file;
  final List<File> files;
  final String viewName;

  const UploadDialog({Key key, @required this.viewName, this.file, this.files})
      : super(key: key);

  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<UploadDialog> {
  String _imageName;
  int _currentImg, _total;
  double _progress;
  File _currentFile;

  @override
  void initState() {
    super.initState();
    if (widget.file != null) {
      _currentFile = widget.file;
      _total = 1;
    } else {
      _currentFile = widget.files[0];
      _total = widget.files.length;
    }
    _currentImg = 0;
    _imageName = p.basename(_currentFile.path);
    _progress = 0;
    Timer(Duration(seconds: 1, milliseconds: 200), () {
      uploadFiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      title: Text(
        'CARGA DE IMAGENES',
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 500,
          ),
          Text(
            'Imagen: $_imageName',
            maxLines: 1,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          LinearProgressIndicator(
            value: (_currentImg + 1) / _total,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.maize),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            '${_currentImg + 1}/$_total',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            'Progreso: ${(_progress * 100).round()}%',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          LinearProgressIndicator(
            value: _progress,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.maize),
          ),
        ],
      ),
    );
  }

  void uploadFiles() async {
    if (widget.file != null) {
      try {
        await uploadFile(_currentFile, widget.viewName, (double progress) {
          setState(() {
            _progress = progress;
          });
        }, (String downloadUrl) {
          Navigator.of(context).pop(downloadUrl);
        });
      } catch (e) {
        print(e.toString());
      }
    } else {
      List<String> downloadUrls = List();
      while (_currentImg < _total) {
        await uploadFile(_currentFile, '${widget.viewName}_$_currentImg',
            (double progress) {
          setState(() {
            _progress = progress;
          });
        }, (String downloadUrl) {
          setState(() {
            _currentImg++;
            if (_currentImg < _total) {
              _currentFile = widget.files[_currentImg];
              _imageName = p.basename(_currentFile.path);
            }
            downloadUrls.add(downloadUrl);
          });
        });
      }
      Navigator.of(context).pop(downloadUrls);
    }
  }
}
