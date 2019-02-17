import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() async {
  Map l = await getJson();
  runApp(new MaterialApp(
    title: "Http_post",
    home: new MyApp(l),
  ));
}

class MyApp extends StatefulWidget {
  Map l;
  MyApp(this.l);

  @override
  _MyAppState createState() => _MyAppState(l);
}

class _MyAppState extends State<MyApp> {
  Map l;

  _MyAppState(this.l);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: new Container(
        // this code is used to get the gradient
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Color(0xFFf56703), Color(0xFFFFE001)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        // this code is used to get the gradient

        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.network(l['asset_map']['question'],
                  height: (MediaQuery.of(context).size.height) * 0.55),
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.network(l['asset_map']['answer']['ans1'],
                          height: (MediaQuery.of(context).size.height) * 0.20),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      new Image.network(l['asset_map']['answer']['ans2'],
                          height: (MediaQuery.of(context).size.height) * 0.20),
                    ],
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.network(l['asset_map']['answer']['ans3'],
                          height: (MediaQuery.of(context).size.height) * 0.20),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      new Image.network(l['asset_map']['answer']['ans4'],
                          height: (MediaQuery.of(context).size.height) * 0.20),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<Map<String,dynamic>> getJson() async {
  var d = {};
  Map<String,dynamic> l;
  var send = await http.post(
      Uri.parse("https://sih-temper-app.herokuapp.com/postdb"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(d),
      encoding: Encoding.getByName("utf-8"));
  l = json.decode(send.body);
  print(send.body);
  print(l['asset_map']['answer']['ans1']);
  print(l['asset_map']['question']);
  return l;
}
