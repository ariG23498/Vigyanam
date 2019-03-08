import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class EndPage extends StatefulWidget {
  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: Stack(
          children: <Widget>[
            Image.asset("assets/end.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width),
            Center(
              child: Padding(
                padding: new EdgeInsets.fromLTRB(15, 110, 0.0, 0.0),
                child: Text(
                  "${overAllScore*10}%",
                  style: TextStyle(color: Color(0xFF0575e6), fontSize: 72),
                ),
              ),
            ),
          ],
        ),
      ),
      //trying new stuff
      floatingActionButton: new FloatingActionButton(
        onPressed: () =>
            SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        tooltip: 'Close app',
        child: new Icon(
          Icons.close,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
    );
  }
}
