import 'package:dio/dio.dart';
import 'package:eventify/models/event_model.dart';
import 'package:eventify/models/guest_model.dart';
import 'package:eventify/models/message_model.dart';
import 'package:eventify/models/vendor_model.dart';
import 'package:eventify/screens/eventpage_screen.dart';
import 'package:eventify/widgets/guests.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import '../../constants.dart';
import '../../credentials.dart';

class AnnouncementCreatorScreen extends StatefulWidget {
  final Event event;
  final List<Guest> guestRecipients;
  final List<Vendor> vendorRecipients;

  AnnouncementCreatorScreen({this.event, this.guestRecipients, this.vendorRecipients});

  @override
  _AnnouncementCreatorScreenState createState() =>
      _AnnouncementCreatorScreenState();
}

class _AnnouncementCreatorScreenState extends State<AnnouncementCreatorScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Message msg = Message(
    subject: '',
    message: '',
  );

  _sendMessage() {
    List<int> guestNumber = List();
    List<String> guestEmail = List();

    for (Guest guest in msg.guestRecipients) {
      switch (guest.mode) {
        case (CommunicationMode.APP):
          print('app');
          break;
        case (CommunicationMode.SMS):
          print('sms');
          guestNumber.add(int.parse(guest.info));
          break;
        case (CommunicationMode.EMAIL):
          print('email');
          guestEmail.add(guest.info);
          break;
        case (CommunicationMode.MESSENGER):
          print('messenger');
          break;
        default:
          break;
      }
    }
    if(guestEmail.length > 0) {
      _sendEmail(guestEmail);
    }
//    _sendSMS(msg.message, guestNumber); //57c left

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EventPageScreen(event: widget.event)));
  }

  void _sendEmail(List<String> recipients) async {
    final Email email = Email(
      body: msg.message,
      subject: msg.subject,
      recipients: recipients,
//      attachmentPaths: attachments,
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  void _sendSMS(String message, List<int> recipients) async {
    String baseURL = 'https://rest.nexmo.com/sms/json';
    Response response = await Dio().post(baseURL, data: {
      "api_key": VONAGE_API_KEY,
      "api_secret": VONAGE_SECRET,
      "to": recipients[0],
      "from": VONAGE_NUMBER,
      "text": message
    });
    print(response);
  }

  void updateMessage({String subject, String message}) {
    setState(() {
      if(subject != null) {
        this.msg.subject = subject;
      }
      if(message != null) {
        this.msg.message = message;
      }
      this.msg.guestRecipients = widget.guestRecipients;
      this.msg.vendorRecipients = widget.vendorRecipients;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _sendMessage();
              }
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: TextEditingController(
                            text: widget.event.name + ' Announcement'
                        ),
                        onSaved: (value){
                          updateMessage(
                              subject: value
                          );
                        },
                        validator: (value) {
                          if(value.isEmpty) {
                            return 'Please enter a subject';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Subject",
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        onSaved: (value){
                          updateMessage(
                              message: value
                          );
                        },
                        validator: (value) {
                          if(value.isEmpty) {
                            return 'Please enter a message';
                          }
                          return null;
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
