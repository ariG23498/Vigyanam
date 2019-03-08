import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'Answer.dart';

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
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Image.asset("assets/cuboid.png",
                height: (MediaQuery.of(context).size.height) * 0.45),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return new Answer(1);
                    }));
                  },
                  child: new Hero(
                      tag: 'hero1',
                      child: new CircleAvatar(
                        child: new Icon(
                          Icons.check,
                          size: MediaQuery.of(context).size.width * 0.20,
                        ),
                        maxRadius: MediaQuery.of(context).size.width * 0.10,
                        backgroundColor: Colors.blue[100],
                      )),
                ),
                new Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                new GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return new Answer(2);
                    }));
                  },
                  child: new Hero(
                      tag: 'hero2',
                      child: new CircleAvatar(
                        child: new Icon(
                          Icons.clear,
                          size: MediaQuery.of(context).size.width * 0.20,
                        ),
                        maxRadius: MediaQuery.of(context).size.width * 0.10,
                        backgroundColor: Colors.blue[100],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> getJson() async {
  var d = {};
  Map<String, dynamic> l;
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
