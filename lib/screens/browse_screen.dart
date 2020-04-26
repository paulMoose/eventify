import 'package:eventify/constants.dart';
import 'package:eventify/models/event_model.dart';
import 'package:eventify/screens/eventpage_screen.dart';
import 'package:eventify/widgets/event_card_widget.dart';
import 'package:eventify/widgets/navigation_menu_widget.dart';
import 'package:eventify/widgets/transparent_rounded_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class BrowseScreen extends StatefulWidget {
  static String id = 'browse_screen';

  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {

    List<Tuple2<Event, EventDateTime>> eventList = [
      Tuple2<Event, EventDateTime>(
        Event(
            name: 'Event',
            location: 'here and there'
        ),
        EventDateTime(
          date: DateTime.utc(2020, 4, 26)
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
      Tuple2<Event, EventDateTime>(
          Event(
              name: 'Smooth Jazz Live',
              location: 'Corona Theatre'
          ),
          EventDateTime(
              date: DateTime.utc(2020, 4, 26)
          )
      ),
      Tuple2<Event, EventDateTime>(
          Event(
              name: 'Sweetness from the South',
              location: 'South Park'
          ),
          EventDateTime(
              date: DateTime.utc(2020, 4, 26)
          )
      ),
    ];

    return Scaffold(
      backgroundColor: CustomColors.aeroBlue,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TransparentRoundedInputWidget(
                      hintText: 'Search for an event',
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Popular near you',
                          style: TextStyle(
                              color: CustomColors.charlestonGreen,
                              fontWeight: FontWeight.w900,
                              fontSize: 30.0
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight - 140 - 30,
                      child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              for(Tuple2<Event, EventDateTime> event in eventList)
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => EventPageScreen(event: event.item1)));
                                  },
                                  child: EventCardWidget(
                                    event: event.item1,
                                    dateTime: event.item2,
                                  ),
                                ),
                            ],
                          )
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          NavigationMenuWidget(),
        ],
      ),
    );
  }
}
