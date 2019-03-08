import 'package:flutter/material.dart';
import 'PageLocation.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class InterPage extends StatefulWidget {
  @override
  _InterPageState createState() => _InterPageState();
}

class _InterPageState extends State<InterPage> {
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
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Final Loation"),
      ),
      body: new Center(
          child: currentLocation == null
              ? new CircularProgressIndicator()
              : new Text("Go To Next Page")),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          print("hello");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Lol()));
        },
        child: Icon(Icons.ac_unit),
      ),
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
