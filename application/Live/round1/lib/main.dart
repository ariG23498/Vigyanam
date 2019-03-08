import 'package:flutter/material.dart';
import 'ageSlab.dart';
import 'bb.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Vigyanam",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: Image.asset(
          "assets/loc.png",
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => Age()));
        },
        child: Icon(Icons.arrow_forward),
        foregroundColor: Color(0xFF128fff),
        backgroundColor: Color(0xFFffffff),
      ),
    );
  }
}
