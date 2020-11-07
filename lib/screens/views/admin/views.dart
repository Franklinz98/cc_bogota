import 'dart:io';

import 'package:cc_bogota/backend/requets.dart';
import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/models/viewData.dart';
import 'package:cc_bogota/models/viewMetadata.dart';
import 'package:cc_bogota/provider/cc_state.dart';
import 'package:cc_bogota/widgets/button.dart';
import 'package:cc_bogota/widgets/ccfield.dart';
import 'package:cc_bogota/widgets/upload_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';

class ViewUpdate extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<ViewUpdate> {
  GlobalKey<FormState> formKey = GlobalKey();
  Function _validator;
  TextEditingController text;
  String _fileName;
  List<File> _files;
  File _file;
  ViewMetadata _selectedView;
  List<DropdownMenuItem> _dropdownItems;
  CCState _appState;

  @override
  void initState() {
    super.initState();
    text = TextEditingController();
    _selectedView = ViewMetadata(0);
    _dropdownItems = getDropDownItems();
    _fileName = 'nada seleccionado';
    _validator = (value) {
      if (value.isEmpty) {
        return 'Por favor llene el campo';
      }
      return null;
    };
    _appState = Provider.of<CCState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 24.0, left: 16.0, right: 16.0, bottom: 8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    'Vista: ',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: _selectedView.value,
                          items: _dropdownItems,
                          onChanged: (value) {
                            setState(() {
                              _selectedView = ViewMetadata(value);
                              text.clear();
                              _fileName = 'nada seleccionado';
                              _file = null;
                              _files = null;
                            });
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              _getForm(),
              SizedBox(
                height: 24.0,
              ),
              CCButton(
                height: 50.0,
                color: AppColors.genoa,
                child: Text("Aceptar".toUpperCase()),
                onPressed: () {
                  if (_file != null || (_files != null && _files.length > 1)) {
                    switch (_selectedView.type) {
                      case ViewType.carroussel:
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => UploadDialog(
                            viewName: _selectedView.key,
                            files: _files,
                          ),
                        ).then(
                          (urls) => updateData(carroussel: urls).then(
                            (value) =>
                                Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Vista actualizada'),
                            )),
                          ),
                        );
                        break;
                      case ViewType.image:
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => UploadDialog(
                            viewName: _selectedView.key,
                            file: _file,
                          ),
                        ).then(
                          (url) => updateData(cover: url).then(
                            (value) => Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Vista actualizada')),
                            ),
                          ),
                        );
                        break;
                      case ViewType.text:
                        if (formKey.currentState.validate()) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => UploadDialog(
                              viewName: _selectedView.key,
                              file: _file,
                            ),
                          ).then((url) =>
                              updateData(cover: url, text: text.text).then(
                                (value) => Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Vista actualizada')),
                                ),
                              ));
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Ingrese el text.'),
                          ));
                        }
                        break;
                      default:
                    }
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Seleccione los archivos.'),
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateData({List carroussel, String cover, String text}) async {
    try {
      switch (_selectedView.type) {
        case ViewType.carroussel:
          ViewData viewData = ViewData(carroussel: carroussel);
          await updateViewData(_selectedView.key, viewData, ViewType.carroussel,
              _appState.authToken);
          break;
        case ViewType.image:
          ViewData viewData = ViewData(cover: cover);
          await updateViewData(
              _selectedView.key, viewData, ViewType.image, _appState.authToken);
          break;
        case ViewType.text:
          ViewData viewData = ViewData(cover: cover, text: text);
          await updateViewData(
              _selectedView.key, viewData, ViewType.text, _appState.authToken);
          break;
        default:
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<DropdownMenuItem> getDropDownItems() {
    final List<String> _names = [
      "Contáctanos",
      "Donaciones",
      "Emprendedores del Reino",
      "Fotos",
      "Iglekids",
      "Inicio",
      "Inscripción a Ruta Académica",
      "Mujeres Determinantes",
      "Nuestra Historia",
      "Nuestra Visión",
      "PFI",
      "R21",
      "Videos"
    ];
    List<DropdownMenuItem> items = List();
    for (var i = 0; i < _names.length; i++) {
      items.add(
        DropdownMenuItem(child: Text(_names[i]), value: i),
      );
    }
    return items;
  }

  Widget _getForm() {
    switch (_selectedView.type) {
      case ViewType.carroussel:
        return _imageModule(multipleFiles: true);
      case ViewType.image:
        return _imageModule(multipleFiles: false);
      case ViewType.text:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _imageModule(multipleFiles: false),
            SizedBox(
              height: 18.0,
            ),
            _textModule(),
          ],
        );
      default:
    }
  }

  Widget _imageModule({bool multipleFiles = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          multipleFiles ? 'Imagenes:' : 'Imagen:',
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        SizedBox(
          height: 12.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.ebony.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    _fileName,
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.image_search),
                  onPressed: () async {
                    FilePickerResult result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: multipleFiles,
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'png']);
                    if (result != null) {
                      setState(() {
                        if (multipleFiles) {
                          _files =
                              result.paths.map((path) => File(path)).toList();
                          _file = null;
                          _fileName =
                              'Se seleccionaron ${_files.length} archivos';
                        } else {
                          _file = File(result.files.single.path);
                          _files = null;
                          _fileName = p.basename(_file.path);
                        }
                      });
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Se canceló la selección.'),
                      ));
                    }
                  })
            ],
          ),
        ),
      ],
    );
  }

  Widget _textModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Texto:',
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        SizedBox(
          height: 12.0,
        ),
        CCField(
          validator: _validator,
          controller: text,
          inputType: TextInputType.multiline,
          maxLines: null,
        ),
      ],
    );
  }

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }
}
