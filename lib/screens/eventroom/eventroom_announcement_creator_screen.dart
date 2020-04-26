import 'package:eventify/models/guest_model.dart';
import 'package:eventify/models/vendor_model.dart';
import 'package:eventify/widgets/guests.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';

class AnnouncementCreatorScreen extends StatefulWidget {
  final List<Guest> guestRecipients;
  final List<Vendor> vendorRecipients;

  AnnouncementCreatorScreen({
    this.guestRecipients, this.vendorRecipients
  });

  @override
  _AnnouncementCreatorScreenState createState() =>
      _AnnouncementCreatorScreenState();
}

class _AnnouncementCreatorScreenState extends State<AnnouncementCreatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.charlestonGreen,
      appBar: AppBar(
        title: Text("Create an Announcement"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CustomColors.charlestonGreen,
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.paperPlane, size: 15),
            tooltip: 'Send Announcement',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Subject",
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "Message",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Guests(hasIcons: false, hasTopBar: false, small: true, guestList: widget.guestRecipients),
          ],
        ),
      ),
    );
  }
}
