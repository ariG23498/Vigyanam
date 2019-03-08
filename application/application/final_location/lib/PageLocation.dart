import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class Lol extends StatefulWidget {
  @override
  _LolState createState() => _LolState();
}

class _LolState extends State<Lol> {
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LOL"),
      ),
      body: new Center(
          child: currentLocation == null
              ? new Text("null")
              : new Text("LATITUDE: ${currentLocation['latitude']}\n LONGITUDE: ${currentLocation['longitude']}")),
    );
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
}
