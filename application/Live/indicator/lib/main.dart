import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MaterialApp(
      title: "Indicator",
      debugShowCheckedModeBanner: false,
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
      body: new Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width,
                animation: true,
                lineHeight: 5.0,
                animationDuration: 2500,
                percent: 0.8,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.blue,
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(5.0)),
                func(1),
                new Padding(padding: EdgeInsets.all(5.0)),
                func(2),
                new Padding(padding: EdgeInsets.all(5.0)),
                func(3),
                new Padding(padding: EdgeInsets.all(5.0)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
