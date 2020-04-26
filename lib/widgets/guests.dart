import 'package:eventify/models/event_model.dart';
import 'package:eventify/models/guest_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'guestlist_pullup_widget.dart';

class Guests extends StatelessWidget {

  Guests({
    @required this.event,
    this.hasTopBar = true,
    this.title = 'Guests',
    this.hasIcons = true,
    this.small = false,
    this.guestList,
  }){
    if (this.guestList == null) {
      this.guestList = guests;
    }
  }

  final Event event;
  final bool hasTopBar;
  final bool hasIcons;
  final bool small;
  final String title;
  List<Guest> guestList;

  _showGuestListSheet(context) {
    showModalBottomSheet(
        context: context,
        elevation: 20,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GuestlistPullup(event: event);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: hasTopBar ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: CustomColors.charlestonGreen,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  hasIcons ? Row(
                    children: <Widget>[
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.bullhorn, size: 15),
                        tooltip: 'Send Announcement',
                        onPressed: () {
                          _showGuestListSheet(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        tooltip: 'Add a Guest',
                        onPressed: () {},
                      ),
                    ],
                  ): Container(),
                ],
              ) : null,
            ),
            Container(
              height: small? 90 : 140.0,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: guestList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: small? 15.0 : 35.0,
                          backgroundImage: AssetImage(guestList[index].imageUrl),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          guestList[index].name,
                          style: TextStyle(
                            color: CustomColors.charlestonGreen,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          guestList[index].role,
                          style: TextStyle(
                            color: CustomColors.hookersGreen,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

