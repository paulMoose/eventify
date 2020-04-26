import 'package:eventify/constants.dart';
import 'package:eventify/models/event_model.dart';
import 'package:eventify/screens/eventroom/eventroom_home_screen.dart';
import 'package:eventify/widgets/guests.dart';
import 'package:eventify/widgets/vendors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';

class EventPageScreen extends StatefulWidget {
  static String id = 'eventpage_screen';

  EventPageScreen({
    @required this.event,
  });

  final Event event;

  @override
  _EventPageScreenState createState() => _EventPageScreenState();
}

class _EventPageScreenState extends State<EventPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                        child: Image(
                            image: AssetImage('images/event1.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    right: 20.0,
                    top: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "2020-05-22",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Text(
                          "5:30 PM - 3:00 AM",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.home, size: 35),
                        tooltip: 'Home',
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, HomeScreen.id);
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    left: 20.0,
                    bottom: 20.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.event.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              size: 15.0,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              widget.event.location,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Guests(event: widget.event),
          Vendors(),
          Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.bookmark),
                    title: Text('Description'),
//                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                        "The Red Wedding is a massacre at the wedding feast of Edmure Tully, Lord of Riverrun, and Roslin Frey at the Twins in 299 AC during the War of the Five Kings. The King in the North, Robb Stark, his mother Catelyn, and most of his three thousand five hundred soldiers are"),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                            widget.event.booked ? 'BOOKED' : 'BUY TICKETS',
                            style: TextStyle(
                                color: widget.event.booked
                                    ? CustomColors.aeroBlue
                                    : CustomColors.hookersGreen)),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                      FlatButton(
                        child: Text('ENTER',
                            style: TextStyle(
                                color: widget.event.booked &&
                                        widget.event.dateTime.date
                                            .isBefore(DateTime.now())
                                    ? CustomColors.hookersGreen
                                    : CustomColors.aeroBlue)),
                        onPressed: () {
                          if (widget.event.booked) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventRoomHomeScreen(
                                        event: widget.event)));
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
