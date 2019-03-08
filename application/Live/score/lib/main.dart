import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "LOL",
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: <Widget>[
          Image.asset("assets/end.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),
          Center(
            child: Padding(
            padding: new EdgeInsets.fromLTRB(15, 110, 0.0, 0.0),
            child: Text(
              "68%",
              style: TextStyle(color: Color(0xFF0575e6), fontSize: 72),
            ),
          ),),
        ],
      ),
    ));
  }
}
