import 'package:flutter/material.dart';

class EndPage extends StatefulWidget {
  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Image.asset("assets/end.png"),
      ),
    );
  }
}