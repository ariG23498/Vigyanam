import 'package:flutter/material.dart';
import 'intermediate.dart';

void main() => runApp(new MaterialApp(
  title: "final_location",
  home: new MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Final Loation"),
      ),
      body: new Center(
        child: new Text(
          "Enable Location Manually"
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          print("hello");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InterPage()));
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

}