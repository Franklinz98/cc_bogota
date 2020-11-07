import 'package:cc_bogota/models/event.dart';
import 'package:flutter/material.dart';
import 'package:cc_bogota/backend/requets.dart';
import 'event_card.dart';

class EventBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CCEvent>>(
      future: getCCEvents(DateTime.now()),
      builder: (BuildContext context, AsyncSnapshot<List<CCEvent>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final List<CCEvent> events = snapshot.data;
            return Row(
              children: <Widget>[
                EventCard(
                  event: events[0],
                ),
                SizedBox(
                  width: 8.0,
                ),
                EventCard(
                  event: events[1],
                ),
                SizedBox(
                  width: 8.0,
                ),
                EventCard(
                  event: events[2],
                ),
                SizedBox(
                  width: 8.0,
                ),
                EventCard(
                  event: events[3],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            Text('error');
          }
        }
        return SizedBox(
          height: 140,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
