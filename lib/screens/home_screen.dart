import 'package:eventify/constants.dart';
import 'package:eventify/screens/browse_screen.dart';
import 'package:eventify/screens/code_screen.dart';
import 'package:eventify/screens/create_screen.dart';
import 'package:eventify/widgets/navigation_menu_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      child: Image.asset('images/logo.png'),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      'EVENTIFY',
                      style: TextStyle(
                          color: CustomColors.charlestonGreen,
                          fontWeight: FontWeight.w900,
                          fontSize: 26.0
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, CreateScreen.id);
                    },
                    child: Container(
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: CustomColors.aeroBlue,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(CustomColors.aeroBlue.withOpacity(0.2), BlendMode.dstATop),
                          image: new NetworkImage('https://images.freeimages.com/images/large-previews/4a7/table-setting-1324449.jpg'),
                          fit: BoxFit.fitWidth
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.2)
                          )
                        ]
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Create event',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 26.0
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, BrowseScreen.id);
                    },
                    child: Container(
                      height: 120.0,
                      decoration: BoxDecoration(
                          color: CustomColors.aeroBlue,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(CustomColors.aeroBlue.withOpacity(0.2), BlendMode.dstATop),
                              image: new NetworkImage('https://images.freeimages.com/images/large-previews/a20/fireworks-3-1526439.jpg'),
                              fit: BoxFit.fitWidth
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(3.0, 3.0),
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.2)
                            )
                          ]
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Browse events',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 26.0
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, CodeScreen.id);
                    },
                    child: Container(
                      height: 70.0,
                      decoration: BoxDecoration(
                          color: CustomColors.hookersGreen,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(3.0, 3.0),
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.2)
                            )
                          ]
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Enter event code',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 22.0
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          NavigationMenuWidget(),
        ],
      ),
    );
  }
}
