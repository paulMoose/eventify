import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';

class Event {
  String name;
  String location;
  EventDateTime dateTime;
  String description;
  String code;
  bool booked = true;
//  DateTime day;
//  TimeOfDay endDateTime;
//  String imageUrl;

  Event({this.name, this.location, this.dateTime, this.booked = true}){
    if (this.dateTime == null) {
      dateTime = EventDateTime(date: DateTime.now());
    }
    this.code = '';
    int seed = 0;
    for(var i = 0; i < this.name.length; i ++) {
      seed += this.name.codeUnitAt(i);
    }
    var rng = new Random(seed);
    for (var i = 0; i < 5; i++) {
      this.code += rng.nextInt(10).toString();
    }
  }
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

List<Event> eventList = [
  Event(
    name: 'Red Wedding',
    location: 'Riverrun',
    dateTime: EventDateTime(
        date: DateTime.utc(2020, 4, 25)
    )
  ),
  Event(
    name: 'Sombra\'s Party',
    location: 'Blizzard World',
    dateTime: EventDateTime(
      date: DateTime.utc(2020, 4, 26)
    )
  ),
  Event(
      name: 'Newbies\' Comedy Club',
      location: 'Little Theatre',
      dateTime: EventDateTime(
          date: DateTime.utc(2020, 5, 8)
      ),
      booked: false
  ),
  Event(
      name: 'DreamHack',
      location: 'Nimbus Stadium',
      dateTime: EventDateTime(
          date: DateTime.utc(2020, 5, 17)
      )
  ),
  Event(
      name: 'Smooth Jazz Live',
      location: 'Corona Theatre',
      dateTime: EventDateTime(
          date: DateTime.utc(2020, 5, 21)
      )
  ),
  Event(
      name: 'Sweetness from the South',
      location: 'South Park',
      dateTime: EventDateTime(
          date: DateTime.utc(2020, 6, 6)
      ),
      booked: false
  ),
];