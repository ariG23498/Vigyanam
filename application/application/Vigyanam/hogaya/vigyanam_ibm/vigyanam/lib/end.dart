import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      //trying new stuff
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
