import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';

class Event {
  String name;
  String location;
  String description;
  String code;
//  DateTime day;
//  TimeOfDay endDateTime;
//  String imageUrl;

  Event({this.name, this.location}){
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