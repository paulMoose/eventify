import 'package:eventify/constants.dart';
import 'package:eventify/models/event_model.dart';
import 'package:eventify/screens/eventpage_screen.dart';
import 'package:eventify/widgets/event_card_widget.dart';
import 'package:eventify/widgets/navigation_menu_widget.dart';
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
                              for(Event event in eventList)
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => EventPageScreen(event: event)));
                                  },
                                  child: EventCardWidget(
                                    event: event,
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
