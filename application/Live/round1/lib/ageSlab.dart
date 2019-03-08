import 'package:flutter/material.dart';
import 'main.dart';
import 'animateAge.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Age extends StatefulWidget {
  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  GestureDetector func(var a) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return new AnimateAge(a);
        }));
      },
      child: new Hero(
        tag: 'hero$a',
        child: Image.asset(
          "assets/age_$a.png",
          width: (MediaQuery.of(context).size.width) * 0.40,
          height: (MediaQuery.of(context).size.height) * 0.20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    func(1),
                    func(2),
                  ],
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    func(3),
                    func(4),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
