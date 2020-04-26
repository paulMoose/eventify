import 'package:dio/dio.dart';
import 'package:eventify/models/guest_model.dart';
import 'package:eventify/models/message_model.dart';
import 'package:eventify/models/vendor_model.dart';
import 'package:eventify/widgets/guests.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sms/flutter_sms.dart';

import '../../constants.dart';
import '../../credentials.dart';

class AnnouncementCreatorScreen extends StatefulWidget {
  final List<Guest> guestRecipients;
  final List<Vendor> vendorRecipients;

  AnnouncementCreatorScreen({this.guestRecipients, this.vendorRecipients});

  @override
  _AnnouncementCreatorScreenState createState() =>
      _AnnouncementCreatorScreenState();
}

class _AnnouncementCreatorScreenState extends State<AnnouncementCreatorScreen> {

  Message msg = Message(
    subject: '',
    message: '',
  );

  _sendMessage() {
//    _sendSMS(msg.message, [15148068277]); //57c left
  }

  void _sendEmail() async {}

  void _sendSMS(String message, List<int> recipents) async {
    String baseURL = 'https://rest.nexmo.com/sms/json';
    Response response = await Dio().post(baseURL, data: {
      "api_key": VONAGE_API_KEY,
      "api_secret": VONAGE_SECRET,
      "to": recipents[0],
      "from": VONAGE_NUMBER,
      "text": message
    });
    print(response);
  }

  void updateMessage({String subject, String message}) {
    setState(() {
      this.msg.subject = subject;
      this.msg.message = message;
      this.msg.guestRecipients = widget.guestRecipients;
      this.msg.vendorRecipients = widget.vendorRecipients;
    });
  }

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
            onPressed: () {
              _sendMessage();
            },
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
                      onChanged: (value){
                        updateMessage(
                          subject: value
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Subject",
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      onChanged: (value){
                        updateMessage(
                            message: value
                        );
                      },
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
            Guests(
                hasIcons: false,
                hasTopBar: false,
                small: true,
                guestList: widget.guestRecipients),
          ],
        ),
      ),
    );
  }
}
