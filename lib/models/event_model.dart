import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../constants.dart';

class Event {
  String name;
  String location;
  String description;
  String code;
  bool booked = true;
//  DateTime day;
//  TimeOfDay endDateTime;
//  String imageUrl;

  Event({this.name, this.location, this.booked = true}){
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

List<Tuple2<Event, EventDateTime>> eventList = [
  Tuple2<Event, EventDateTime>(
    Event(
      name: 'Red Wedding',
      location: 'Riverrun'
    ),
    EventDateTime(
      date: DateTime.utc(2020, 4, 25)
    )
  ),
  Tuple2<Event, EventDateTime>(
    Event(
      name: 'Sombra\'s Party',
      location: 'Blizzard World'
    ),
    EventDateTime(
      date: DateTime.utc(2020, 4, 26)
    )
  ),
  Tuple2<Event, EventDateTime>(
    Event(
      name: 'Newbies\' Comedy Club',
      location: 'Little Theatre',
      booked: false
    ),
    EventDateTime(
      date: DateTime.utc(2020, 5, 8)
    )
  ),
  Tuple2<Event, EventDateTime>(
    Event(
      name: 'DreamHack',
      location: 'Nimbus Stadium'
    ),
    EventDateTime(
      date: DateTime.utc(2020, 5, 17)
    )
  ),
  Tuple2<Event, EventDateTime>(
    Event(
      name: 'Smooth Jazz Live',
      location: 'Corona Theatre'
    ),
    EventDateTime(
      date: DateTime.utc(2020, 5, 21)
    )
  ),
  Tuple2<Event, EventDateTime>(
    Event(
      name: 'Sweetness from the South',
      location: 'South Park',
        booked: false
    ),
    EventDateTime(
      date: DateTime.utc(2020, 6, 6)
    )
  ),
];