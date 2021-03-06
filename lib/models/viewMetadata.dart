import 'package:cc_bogota/constants/enums.dart';

class ViewMetadata {
  String name, key;
  int value;
  ViewType type;
  final List<int> _types = [2, 2, 2, 1, 2, 0, 1, 1, 2, 2, 2, 2, 1, 2, 1];
  final List<String> _names = [
    "Contáctanos",
    "Donaciones",
    "Emprendedores del Reino",
    "Fotos",
    "Iglekids",
    "Inicio",
    "Inscripción a Ruta Académica",
    "Queremos Conocerte",
    "Mujeres Determinantes",
    "Nuestra Historia",
    "Nuestra Visión",
    "Nuestros Pastores",
    "PFI",
    "R21",
    "Videos"
  ];
  final List<String> _keys = [
    "contact",
    "donations",
    "entrepenour",
    "pictures",
    "iglekids",
    "home",
    "school",
    "knowyou",
    "women",
    "history",
    "aboutUs",
    "pastors",
    "pfi",
    "r21",
    "video"
  ];

  ViewMetadata(this.value) {
    name = _names[value];
    key = _keys[value];
    type = ViewType.values[_types[value]];
  }
}
