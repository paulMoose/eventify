import 'package:eventify/models/event_model.dart';
import 'package:eventify/screens/eventroom/eventroom_home_screen.dart';
import 'package:eventify/widgets/guests.dart';
import 'package:eventify/widgets/vendors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          Guests(),
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
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('BUY TICKETS'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                      FlatButton(
                        child: const Text('ENTER'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => EventRoomHomeScreen(event: widget.event)));
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
