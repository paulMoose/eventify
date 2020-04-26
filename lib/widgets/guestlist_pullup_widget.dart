import 'package:eventify/models/event_model.dart';
import 'package:eventify/models/guest_model.dart';
import 'package:eventify/screens/eventroom/eventroom_announcement_creator_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class GuestlistPullup extends StatefulWidget {
  final Event event;

  const GuestlistPullup({
    Key key, this.event
  }) : super(key: key);

  @override
  _GuestlistPullupState createState() => _GuestlistPullupState();
}

class GuestStatus {
  GuestStatus({this.guestID, this.isSelected});

  final int guestID;
  bool isSelected;
}

class _GuestlistPullupState extends State<GuestlistPullup> {
  List<GuestStatus> _guestsStatuses = new List(guests.length);
  bool isAllSelected = false;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < guests.length; i++) {
      _guestsStatuses[i] =
          GuestStatus(guestID: guests[i].id, isSelected: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    void _selectGuest(int id) {
      GuestStatus guest =
          _guestsStatuses.firstWhere((object) => object.guestID == id);
      setState(() {
        guest.isSelected = !guest.isSelected;
        isAllSelected = false;
      });
    }

    void _toggleSelectAllGuests() {
      setState(() {
        if (isAllSelected) {
          for (var i = 0; i < _guestsStatuses.length; i++) {
            _guestsStatuses[i].isSelected = false;
          }
          isAllSelected = false;
        } else {
          for (var i = 0; i < _guestsStatuses.length; i++) {
            _guestsStatuses[i].isSelected = true;
          }
          isAllSelected = true;
        }
      });
    }

    bool _hasSelected() {
      for (var guest in _guestsStatuses) {
        if (guest.isSelected) {
          return true;
        }
      }
      return false;
    }

    void _sendMessage() {
      if (!_hasSelected()) {
        return;
      }
      List<Guest> recipients = List();
      for(GuestStatus status in _guestsStatuses) {
        if(status.isSelected) {
          recipients.add(getGuestFromId(status.guestID));
        }
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AnnouncementCreatorScreen(event: widget.event, guestRecipients: recipients)));
    }

    return Container(
        height: MediaQuery.of(context).size.height - 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Guest List",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Colors.black)),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.checkDouble, size: 15),
                        tooltip: 'Send Announcement',
                        onPressed: () {
                          _toggleSelectAllGuests();
                        },
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.commentAlt, size: 15),
                        tooltip: 'Send',
                        onPressed: () {
                          _sendMessage();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: guests.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _selectGuest(guests[index].id);
                        },
                        child: Card(
                          elevation: 0,
                          color: _guestsStatuses[index].isSelected
                              ? CustomColors.aeroBlue
                              : Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 35.0,
                                  backgroundImage:
                                      AssetImage(guests[index].imageUrl),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      guests[index].name,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0),
                                    ),
                                    Text(
                                      guests[index].role,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0),
                                    ),
                                  ],
                                ),
                                Spacer(
                                  flex: 8,
                                ),
                                IconButton(
                                  icon: FaIcon(
                                    FontAwesomeIcons.checkCircle,
                                    size: 15,
                                    color: _guestsStatuses[index].isSelected
                                        ? CustomColors.hookersGreen
                                        : Colors.white,
                                  ),
                                  tooltip: 'Send Announcement',
                                  onPressed: () {},
                                ),
                                Divider(
                                  thickness: 1.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
