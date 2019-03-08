import 'main.dart';
import 'bb.dart';
import 'package:flutter/material.dart';

class AnimateAge extends StatefulWidget {
  final int a;
  AnimateAge(this.a);
  @override
  _AnimateAgeState createState() => _AnimateAgeState(a);
}

class _AnimateAgeState extends State<AnimateAge> {
  final int a;
  _AnimateAgeState(this.a);

  //animation
  WillPopScope fun(var index) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Image.asset(
        "assets/age_$a.png",
        width: (MediaQuery.of(context).size.width) * 0.40,
        height: (MediaQuery.of(context).size.height) * 0.20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Center(
          child: new Hero(
            tag: "hero$a",
            child: fun(a),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Quiz");
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => bb()));
        },
        child: Icon(Icons.arrow_forward),
        foregroundColor: Color(0xFF128fff),
        backgroundColor: Color(0xFFffffff),
      ),
    );
  }
}
