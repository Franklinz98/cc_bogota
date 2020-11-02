class ViewData {
  String _cover, _text;
  List _carroussel;
  Map _redirect;

  String get cover => _cover;
  String get text => _text;
  List get carroussel => _carroussel;
  Map get redirect => _redirect;

  ViewData({String cover, String text, List carroussel, Map map}) {
    _cover = cover;
    _text = text;
    _carroussel = carroussel;
    _redirect = map;
  }

  factory ViewData.fromJson(Map map) {
    return ViewData(
      cover: map['cover'] ?? '',
      text: map['text'] ?? '',
      carroussel: map['carroussel'] ?? List(),
      map: map['list'] ?? {},
    );
  }

  Map<String, dynamic> toJson(int viewType) {
    switch (viewType) {
      case 1:
        return {'cover': _cover, 'text': _text};
      case 2:
        return {'cover': _cover};
      case 3:
        return {'list': _redirect};
      default:
        return {'carroussel': _carroussel};
    }
  }
}
