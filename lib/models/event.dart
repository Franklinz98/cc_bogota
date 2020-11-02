import 'package:flutter/foundation.dart';

class CCEvent {
  final String title;
  final DateTime dateTime;

  const CCEvent({@required this.title, @required this.dateTime});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': dateTime.millisecondsSinceEpoch,
    };
  }

  factory CCEvent.fromJson(Map<String, dynamic> json) {
    return CCEvent(
      title: json['title'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['date']),
    );
  }
}
