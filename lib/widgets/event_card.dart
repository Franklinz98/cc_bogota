import 'package:cc_bogota/constants/colors.dart';
import 'package:cc_bogota/constants/enums.dart';
import 'package:cc_bogota/models/event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final CCEvent event;

  const EventCard({
    Key key,
    @required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventCardType type = event.dateTime.day == DateTime.now().day
        ? EventCardType.current
        : EventCardType.future;
    return Expanded(
      child: GestureDetector(
        child: Container(
          height: 140.00,
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: type == EventCardType.current
                ? AppColors.maize
                : AppColors.ebony,
            borderRadius: BorderRadius.circular(4.00),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  event.title,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: type == EventCardType.current
                        ? AppColors.black_russian
                        : Colors.white,
                  ),
                ),
              ),
              type == EventCardType.current
                  ? Text(
                      "HOY",
                      style: TextStyle(
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.black_russian,
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          DateFormat("dd", "es-CO").format(event.dateTime),
                          style: TextStyle(
                            fontFamily: "Open Sans",
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          DateFormat.MMM("es-CO")
                              .format(event.dateTime)
                              .toUpperCase(),
                          style: TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
              type == EventCardType.current
                  ? Text(
                      DateFormat("MMMM y", "es-CO")
                          .format(event.dateTime)
                          .toUpperCase(),
                      style: TextStyle(
                        fontFamily: "Open Sans",
                        fontSize: 12,
                        color: AppColors.black_russian,
                      ),
                    )
                  : Text(
                      DateFormat.jm().format(event.dateTime),
                      style: TextStyle(
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
