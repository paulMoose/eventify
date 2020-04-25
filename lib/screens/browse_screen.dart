import 'package:eventify/widgets/event_card_widget.dart';
import 'package:eventify/widgets/transparent_rounded_input_widget.dart';
import 'package:flutter/material.dart';

class BrowseScreen extends StatefulWidget {
  static String id = 'browse_screen';

  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {

    List<Widget> eventList = [
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
      ),
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
      ),
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
      ),
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
      ),
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
      ),
      EventCardWidget(
        month: 'april',
        day: '26',
        title: 'Event',
        description: 'This is an event',
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
                              color: Color(0xFFF7FFF6),
                              fontWeight: FontWeight.w900,
                              fontSize: 30.0
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight - 139,
                      child: SingleChildScrollView(
                          child: Column(
                            children: eventList,
                          )
                      ),
                    ),
                  ],
                );
              },
            ),

          ),
        ],
      ),
    );
  }
}
