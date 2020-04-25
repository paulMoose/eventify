import 'package:flutter/material.dart';

import '../constants.dart';

class Event {
  String name;
  Address address;
  String locationName;
  String startDateTime;
  String endDateTime;
  String imageUrl;

  Event({this.name});
}

class Address {
  String street;
  String city;
  String country;
  String state;
  String postalCode;

  Address({this.street, this.city, this.country, this.state, this.postalCode});
}

class EventDateTime {
  DateTime date;
  TimeOfDay time;

  EventDateTime({this.date});
}

List<String> eventTypes = [
   "Charities",
   "Weddings",
   "Birthdays",
   "Other"
];

List<Widget> placesList = [
  Card(
    color: CustomColors.aeroBlue,
    child: ListTile(
      leading: Icon(
        Icons.add_location,
        color: CustomColors.hookersGreen,
      ),
      title: Text('Two-line ListTile'),
    ),
  ),
  Card(
    color: CustomColors.aeroBlue,
    child: ListTile(
      leading: Icon(
        Icons.add_location,
        color: CustomColors.hookersGreen,
      ),
      title: Text('Two-line ListTile'),
    ),
  ),
  Card(
    color: CustomColors.aeroBlue,
    child: ListTile(
      leading: Icon(
        Icons.add_location,
        color: CustomColors.hookersGreen,
      ),
      title: Text('Two-line ListTile'),
    ),
  ),
  Card(
    color: CustomColors.aeroBlue,
    child: ListTile(
      leading: Icon(
        Icons.add_location,
        color: CustomColors.hookersGreen,
      ),
      title: Text('Two-line ListTile'),
    ),
  ),
  Card(
    color: CustomColors.aeroBlue,
    child: ListTile(
      leading: Icon(
        Icons.add_location,
        color: CustomColors.hookersGreen,
      ),
      title: Text('Two-line ListTile'),
    ),
  ),
];