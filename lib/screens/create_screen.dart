import 'dart:async';

import 'package:eventify/models/event_model.dart';
import 'package:eventify/widgets/transparent_rounded_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:eventify/credentials.dart';
import 'package:dio/dio.dart';

import '../constants.dart';

class CreateScreen extends StatefulWidget {
  static final String id = 'create_event2';

  @override
  _CreateScreenState createState() {
    return _CreateScreenState();
  }
}

class _CreateScreenState extends State<CreateScreen> {
  SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;
  bool _isAnimationReversed = false;
  int _currentPage = 0;
  List<Widget> _pages = [
    _NameFormPage(),
    _LocationSelectionPage(),
    _DateTimeFormPage()
  ];

  void _changePage(newPageIndex) {
    if (newPageIndex >= 0 && newPageIndex < _pages.length) {
      setState(() {
        _isAnimationReversed = newPageIndex > _currentPage ? true : false;
        _currentPage = newPageIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.aeroBlue,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    _currentPage == _pages.length - 1
                        ? Colors.white
                        : Colors.transparent,
                  ],
                  stops: [
                    0.5,
                    0.5
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: CustomColors.charlestonGreen,
                      ),
                      tooltip: 'Go Back',
                      onPressed: () {
                        _changePage(_currentPage - 1);
                      },
                    ),
                    Text(
                      "Back",
                      style: TextStyle(color: CustomColors.charlestonGreen),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    child: PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 500),
                      reverse: !_isAnimationReversed,
                      transitionBuilder: (
                          Widget child,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          ) {
                        return SharedAxisTransition(
                          child: child,
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: _transitionType,
                        );
                      },
                      child: _pages[_currentPage],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Material(
                    color: CustomColors.hookersGreen,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: MaterialButton(
                      onPressed: () {
                        _changePage(_currentPage + 1);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        _currentPage == _pages.length - 1
                            ? "Finish"
                            : "Continue",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NameFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 40),
            Text('What would you like to name your event?',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
            TransparentRoundedInputWidget(
              hintText: 'Name of the Event',
              autofocus: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _DateTimeFormPage extends StatefulWidget {
  @override
  __DateTimeFormPageState createState() => __DateTimeFormPageState();
}

class __DateTimeFormPageState extends State<_DateTimeFormPage> {
  RangeValues _startTime = RangeValues(960.0, 1620.0);

  String getTimeFromMinutes(double value) {
    num totalMinutes = value.round();
    num hour = (totalMinutes / 60).floor();
    hour = hour.round();
    num minute = totalMinutes % 60;
    String period = 'AM';

    if (hour >= 24) {
      hour = hour - 24;
    }

    if (hour >= 12 && hour < 24) {
      if (hour > 12) {
        hour = hour - 12;
      }
      period = 'PM';
    }

    String stringHour = "$hour";
    String stringMinute = "$minute";

    if (minute < 10) {
      stringMinute = "0$minute";
    }
    if (hour < 10) {
      stringHour = "0$hour";
    }

    return "$stringHour:$stringMinute $period";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  "What time will the event take place?",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                RangeSlider(
                  values: _startTime,
                  min: 0,
                  max: 2850,
                  labels: RangeLabels(getTimeFromMinutes(_startTime.start),
                      getTimeFromMinutes(_startTime.end)),
                  activeColor: CustomColors.charlestonGreen,
                  inactiveColor: CustomColors.aeroBlue,
                  divisions: 95,
                  onChanged: (RangeValues newRange) {
                    setState(() {
                      _startTime = newRange;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Start Time"),
                        Chip(
                          label: Text(getTimeFromMinutes(_startTime.start)),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("End Time"),
                        Chip(
                          label: Text(getTimeFromMinutes(_startTime.end)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LocationSelectionPage extends StatefulWidget {
  @override
  __LocationSelectionPageState createState() => __LocationSelectionPageState();
}

class __LocationSelectionPageState extends State<_LocationSelectionPage> {
  String _heading;
  String selectedLocation;
  bool isSelected = false;
  List<String> _placesList = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _heading = "Suggestions";
  }

  void selectLocation(int index) {
    setState(() {
      selectedLocation = _placesList[index];
      _selectedIndex = index;
    });
  }

  void getLocationResults(String input) async {
    if (input.isEmpty) {
      setState(() {
        _heading = "Suggestions";
      });
      return;
    }

    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$PLACES_API_KEY';
    Response response = await Dio().get(request);
    final predictions = response.data['predictions'];

    List<String> results = [];

    for (var data in predictions) {
      results.add(data["description"]);
    }

    setState(() {
      _heading = "Results";
      _placesList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.add_location,
                  size: 20.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Text('Where will it take place?',
                    style:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              ],
            ),
            TransparentRoundedInputWidget(
              hintText: 'Search for a location',
              onChaged: (value) {
                getLocationResults(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(children: <Widget>[
                Expanded(child: Divider()),
                Text(_heading),
                Expanded(child: Divider()),
              ]),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: _placesList.length,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: _selectedIndex != null && _selectedIndex == index
                        ? CustomColors.charlestonGreen
                        : CustomColors.aeroBlue,
                  ),
                  child: ListTile(
                    title: Text(
                      _placesList[index],
                      style: TextStyle(
                        color: _selectedIndex != null && _selectedIndex == index
                            ? CustomColors.aeroBlue
                            : CustomColors.charlestonGreen,
                      ),
                    ),
                    onTap: () => selectLocation(index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
