import 'package:eventify/models/vendor_model.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Vendors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Vendors',
                  style: TextStyle(
                    color: CustomColors.charlestonGreen,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  tooltip: 'Add a Guest',
                  onPressed: () { },
                ),
              ],
            ),
          ),
          Container(
            height: 140.0,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: vendors.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage:
                        AssetImage(vendors[index].imageUrl),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        vendors[index].name,
                        style: TextStyle(
                          color: CustomColors.charlestonGreen,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        vendors[index].type,
                        style: TextStyle(
                          color: CustomColors.hookersGreen,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}