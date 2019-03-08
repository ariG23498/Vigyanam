//for json conversion
import 'dart:convert';
//for json conversion

import 'package:flutter/material.dart';

//import for http
import 'package:http/http.dart' as http;
//import for http
import 'question.dart';

void main() {
  runApp(new MaterialApp(
    title: "Vigyanam",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Map response = new Map();
  // List question_id = new List();
  // List ui_id = new List();
  // Map routes = {'bb':bb(),'tb':tb(),'ag':ag(),'tf':tf(),'cp':cp()};
  // int countPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        // onPressed: () async {
        //   getJson().then((l) {
        //     List elements = l['map'];
        //     for (int i = 0; i < elements.length; i++) {
        //       // print(elements[i]['qid']);
        //       question_id.add(elements[i]['qid']);
        //       ui_id.add(elements[i]['ui_type']);
        //     }
        //     print(question_id);
        //     print(ui_id);
        //     countPage++;
        //     Navigator.push(
        //         context,
        //         new MaterialPageRoute(
        //             builder: (context) => routes['${ui_id[countPage]}']));
        //   });
        // },
        onPressed: (){
          Navigator.push(
                 context,
                 new MaterialPageRoute(
                     builder: (context) =>cp()));
           }),
    );
  }
}
