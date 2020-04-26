import 'package:eventify/constants.dart';
import 'package:eventify/models/event_model.dart';
import 'package:eventify/widgets/event_card_widget.dart';
import 'package:eventify/widgets/navigation_menu_widget.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  static String id = 'events_screen';

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.aeroBlue,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'My events',
                          style: TextStyle(
                              color: CustomColors.charlestonGreen,
                              fontWeight: FontWeight.w900,
                              fontSize: 30.0
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight - 75 - 30,
                      child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              for(Event event in eventList)
                                getBookedEventWidget(event)
                            ],
                          )
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
          NavigationMenuWidget(),
        ],
      ),
    );
  }
}

Widget getBookedEventWidget(Event event) {
  if(event.booked) {
    return EventCardWidget(
      event: event,
      canView: true,
      canEnter: event.dateTime.date.isBefore(DateTime.now()) ? true : false,
    );
  }
  return SizedBox(height: 0.0);
}