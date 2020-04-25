import 'package:eventify/models/event_model.dart';
import 'package:eventify/widgets/event_card_widget.dart';
import 'package:eventify/widgets/navigation_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class EventsScreen extends StatefulWidget {
  static String id = 'events_screen';

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {

    List<Tuple2<Event, EventDateTime>> eventList = [
      Tuple2<Event, EventDateTime>(
          Event(
              name: 'Newbies\' Comedy Club',
              location: 'Little Theatre'
          ),
          EventDateTime(
              date: DateTime.utc(2020, 4, 25)
          )
      ),
      Tuple2<Event, EventDateTime>(
          Event(
              name: 'Party',
              location: 'here and here'
          ),
          EventDateTime(
              date: DateTime.utc(2020, 5, 4)
          )
      ),
      Tuple2<Event, EventDateTime>(
          Event(
              name: 'ComicCon',
              location: 'there and here'
          ),
          EventDateTime(
              date: DateTime.utc(2020, 5, 17)
          )
      ),
      Tuple2<Event, EventDateTime>(
          Event(
              name: 'Convention',
              location: 'there and there'
          ),
          EventDateTime(
              date: DateTime.utc(2020, 6, 20)
          )
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFF272D2D),
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
                              color: Color(0xFFF7FFF6),
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
                              for(Tuple2<Event, EventDateTime> event in eventList)
                                EventCardWidget(
                                  event: event.item1,
                                  dateTime: event.item2,
                                  canView: true,
                                  canEnter: event.item2.date.isBefore(DateTime.now()) ? true : false,
                                ),
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
