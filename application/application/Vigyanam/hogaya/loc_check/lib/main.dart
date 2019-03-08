import 'package:flutter/material.dart';
import 'ageSlab.dart';
import 'dart:async';
import 'package:device_id/device_id.dart';

String androidId = 'unknown';
Map<String, double> currentLocation = new Map();
Map auth = new Map();
void main() {
  runApp(new MaterialApp(
    title: "Check",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //to check whether the Android id has been recieved or not
  bool recieveId = false;

  @override
  void initState() {
    super.initState();
    initDeviceId();
  }

  Future<void> initDeviceId() async {
    DeviceId.getID.then((deviceid) {
      setState(() {
        androidId = deviceid;
        //turns the recieve boolean to be true
        recieveId = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //if the android id is recieved
    if (recieveId) {
      print("build1");
      return new MaterialApp(
        home: new Scaffold(
          floatingActionButton: new FloatingActionButton(
            onPressed: () {
              auth['usr_id'] = androidId;
              Navigator.push(
                  context, new MaterialPageRoute(builder: (context) => Age()));
            },
            child: Icon(Icons.arrow_forward),
            foregroundColor: Color(0xFF128fff),
            backgroundColor: Color(0xFFffffff),
          ),
        ),
      );
    }
    //if the android id has not been recieved
    else {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text("Not done"),
          ),
        ),
      );
    }
  }
}
