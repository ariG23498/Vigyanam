//for json conversion
import 'dart:convert';
//for json conversion

import 'package:flutter/material.dart';

//import for http
import 'package:http/http.dart' as http;
//import for http

import 'tb.dart';
import 'tf.dart';
import 'ag.dart';
import 'bb.dart';
import 'cp.dart';

Map response = new Map();
List question_id = new List();
List ui_id = new List();
Map routes = {'bb': bb(), 'tb': tb(), 'ag': ag(), 'tf': tf(), 'cp': cp()};
int countPage = -1;

Map send = new Map();

class quizMain extends StatefulWidget {
  @override
  _quizMainState createState() => _quizMainState();
}

class _quizMainState extends State<quizMain> {
  @override
  void initState() {
    super.initState();

    getJson().then((l) {
      List elements = l['map'];
      for (int i = 0; i < elements.length; i++) {
        // print(elements[i]['qid']);
        question_id.add(elements[i]['qid']);
        ui_id.add(elements[i]['ui_type']);
      }
      print(question_id);
      print(ui_id);
      countPage++;
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => routes['${ui_id[countPage]}']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
          child: new Image.asset("assets/logoS.gif"),
          widthFactor: MediaQuery.of(context).size.width * 0.20,
          heightFactor: MediaQuery.of(context).size.height * 0.20),
    );
  }
}

Future<Map<String, dynamic>> getJson() async {
  var d = {};
  Map<String, dynamic> l;
  var send = await http.get(
    Uri.parse("https://sih-temper-app.eu-gb.mybluemix.net/getasset"),
    headers: {"Content-Type": "application/json"},
  );
  l = json.decode(send.body);
  //print(send.body);
  return l;
}
