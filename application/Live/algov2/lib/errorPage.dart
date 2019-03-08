import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Image.asset("assets/err.png"),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        tooltip: 'Close app',
        child: new Icon(Icons.close,),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
    );
  }
}