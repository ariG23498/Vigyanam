import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

import 'package:unique_identifier/unique_identifier.dart';

class Lol extends StatefulWidget {
  @override
  _LolState createState() => _LolState();
}

class _LolState extends State<Lol> {
  //identifier
  String _identifier;
  //identifier

  Map<String, double> currentLocation = new Map();
  Location location = new Location();
  StreamSubscription<Map<String, double>> locationSubscription;
  String error;
  Map d = new Map();

  @override
  initState() {
    super.initState();
    //default variables set is 0
    _identifier = "unknown";
    currentLocation['latitude'] = 0.0;
    currentLocation['longitude'] = 0.0;

    initPlatformState();
    initUniqueIdentifierState();
    // locationSubscription =
    //     location.onLocationChanged().listen((Map<String, double> result) {
    //   setState(() {
    //     currentLocation = result;

    //     d = {
    //       'usr_id':_identifier,
    //       'latitude': currentLocation['latitude'],
    //       'longitude': currentLocation['longitude']
    //     };
    //     getJson(d);
    //   });
    // });
  }

  Future<void> initPlatformState() async {
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

    if (!mounted) {
      return;
    }

    setState(() {
      currentLocation = my_location;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_identifier != 'unknown') {
      var d = {
        'usr_id' :_identifier,
        'latitude': currentLocation['latitude'],
        'longitude': currentLocation['longitude'],
      };
      getJson(d);
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LOL"),
      ),
      body: new Center(
          child: currentLocation == null
              ? new Text("null")
              : new Text(
                  "LATITUDE: ${currentLocation['latitude']}\n LONGITUDE: ${currentLocation['longitude']}\n ANDROIDID: ${_identifier}")),
    );
  }

  Future<void> initUniqueIdentifierState() async {
    String identifier;
    try {
      identifier = await UniqueIdentifier.serial;
    } on PlatformException {
      identifier = 'Failed to get Unique Identifier';
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _identifier = identifier;
    });
  }
}

Future<Map<String, dynamic>> getJson(var d) async {
  Map<String, dynamic> l;
  var send = await http.put(
      Uri.parse("https://sih-temper-app.herokuapp.com/sendusrloc/${d['usr_id']}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(d),
      encoding: Encoding.getByName("utf-8"));
  l = json.decode(send.body);
  print(send.body);
  // print(l['asset_map']['answer']['ans1']);
  // print(l['asset_map']['question']);
  return l;
}
