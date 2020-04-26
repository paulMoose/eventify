import 'dart:core';

import 'package:eventify/models/guest_model.dart';
import 'package:eventify/models/vendor_model.dart';
import 'package:flutter/cupertino.dart';

class Message {
  String subject;
  String message;
  List<Guest> guestRecipients;
  List<Vendor> vendorRecipients;
  DateTime dateTime;

  Message({
    @required this.subject,
    @required this.message,
    this.guestRecipients,
    this.vendorRecipients,
    this.dateTime
  }) {
    if (this.dateTime == null) {
      this.dateTime = DateTime.now();
    }
  }
}