import 'package:flutter/material.dart';
import 'splash/intermediate.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Vigyanam",
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Text("Enable Location Manually"),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>InterPage()));
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