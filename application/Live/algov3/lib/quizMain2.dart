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

import 'quizMain.dart';
import 'main.dart';


class quizMain2 extends StatefulWidget {
  @override
  _quizMain2State createState() => _quizMain2State();
}

class _quizMain2State extends State<quizMain2> {
  @override
  void initState() {
    super.initState();

    getJson2().then((l) {
      List elements = l['map'];
      for (int i = 0; i < elements.length; i++) {
        // print(elements[i]['qid']);
        //hint
        hint.add(elements[i]['hint']);
        //hint
        question_id.add(elements[i]['qid']);
        ui_id.add(elements[i]['ui_type']);
      }
      print(question_id);
      print(ui_id);
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => routes['${ui_id[countPage]}']));
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Quiz Main 2");
    return Scaffold(
      body: new Center(
          child: new Image.asset("assets/logoS.gif"),
          widthFactor: MediaQuery.of(context).size.width * 0.20,
          heightFactor: MediaQuery.of(context).size.height * 0.20),
    );
  }
}

Future<Map<String, dynamic>> getJson2() async {
  Map<String, dynamic> l;
  var send = await http.get(
    Uri.parse("https://sih-temper-app.herokuapp.com/getasset/$androidId/round_three"),
    headers: {"Content-Type": "application/json"},
  );
  l = json.decode(send.body);
  print(send.body);
  return l;
}
