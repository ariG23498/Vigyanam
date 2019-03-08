import 'package:flutter/material.dart';
import 'location.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class InterPage extends StatefulWidget {
  @override
  _InterPageState createState() => _InterPageState();
}

class _InterPageState extends State<InterPage> {
  //for location
  Map<String, double> currentLocation = new Map();
  Location location = new Location();
  StreamSubscription<Map<String, double>> locationSubscription;
  String error;

  @override
  void initState() {
    super.initState();
    //default variables set is 0
    currentLocation['latitude'] = 0.0;
    currentLocation['longitude'] = 0.0;

    initPlatformState();

    locationSubscription =
        location.onLocationChanged().listen((Map<String, double> result) {
      setState(() {
        currentLocation = result;
      });
    });
  }

  void initPlatformState() async {
    Map<String, double> my_location;
    try {
      my_location = await location.getLocation();
      error = "";
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED')
        error = 'Permission denied';
      else if (e.code == 'PERMISSION_DENIED_NEVER_ASK')
        error =
            'Permission denied, please ask the user to enable form settings';
      my_location = null;
    }
    setState(() {
      currentLocation = my_location;
    });
  }
  //for location

  @override
  Widget build(BuildContext context) {
    GestureDetector func(var a) {
      return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return new AgeLoc(a);
          }));
        },
        child: new Hero(
          tag: 'hero$a',
          child: new Image.asset(
            "assets/age$a.png",
            width: (MediaQuery.of(context).size.width) * 0.40,
          ),
        ),
      );
    }

    if (currentLocation == null) {
      return Scaffold(
        body: new Center(
          child: new Text("LOCATION NOT ENABLED ^_^"),
        ),
      );
    }//if location is not set 
    else {
      return Scaffold(
        body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      func(0),
                      func(1),
                    ],
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      func(2),
                      func(3),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
