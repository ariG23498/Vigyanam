import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:splash_screen/question/question.dart';
import 'package:splash_screen/error/error.dart';

class AgeLoc extends StatefulWidget {
  final int a; //for age
  AgeLoc(this.a);
  @override
  _AgeLocState createState() => _AgeLocState(a);
}

class _AgeLocState extends State<AgeLoc> {
  int a; //age
  _AgeLocState(this.a);

  //identifier
  String _identifier;
  //identifier

  Map m = new Map();

  Map<String, double> currentLocation = new Map();
  Location location = new Location();
  String error;
  Map d = new Map();
  String errorCode = "";
  @override
  initState() {
    super.initState();
    _identifier = "unknown";
    currentLocation['latitude'] = 0.0;
    currentLocation['longitude'] = 0.0;

    initPlatformState();
    initUniqueIdentifierState();
    getErrorCode();
  }

  Future<void> getErrorCode() async {
    String err;
    var d = {
      'age_slab': a,
      'usr_id': _identifier,
      'latitude': currentLocation['latitude'],
      'longitude': currentLocation['longitude'],
    };
    m = await getJson(d);
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

  Future<Map<String, dynamic>> getJson(var d) async {
    Map<String, dynamic> l;
    var send = await http.put(
        Uri.parse(
            "https://sih-temper-app.herokuapp.com/sendusrloc/${d['usr_id']}"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(d),
        encoding: Encoding.getByName("utf-8"));
    l = json.decode(send.body);
    print(l);
    // print(l['asset_map']['answer']['ans1']);
    // print(l['asset_map']['question']);
    return l;
  }

  @override
  Widget build(BuildContext context) {
    WillPopScope fun(var index) {
      return new WillPopScope(
        onWillPop: () async => false,
        child: Image.asset("assets/age$index.png",
            height: (MediaQuery.of(context).size.height) * 0.50),
      );
    }

    return Scaffold(
      body: new Container(
        child: new Center(
          child: new Hero(
            tag: "hero$a",
            child: fun(a),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        // onPressed: () async {
        //   if (_identifier != 'unknown') {
        //     var d = {
        //       'age_slab': a,
        //       'usr_id': _identifier,
        //       'latitude': currentLocation['latitude'],
        //       'longitude': currentLocation['longitude'],
        //     };
        // Map m = await getJson(d);
        // if( m['code'] == "400"){
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Error()));
        // }
        // else{
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Question()));
        // }
        //   }
        // },
        onPressed: () {
          if (m['code'] == "400") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Error()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Question()));
          }
        },
        child: new Icon(
          Icons.arrow_forward,
        ),
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Color(0xFF128fff),
      ),
    );
  }
}
