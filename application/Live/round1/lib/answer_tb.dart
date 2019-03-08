import 'package:flutter/material.dart';
import 'end.dart';

class Answer extends StatelessWidget {
  final int a;
  Answer(this.a);
  @override
  Widget build(BuildContext context) {
    Image fun(var index) {
      return Image.asset(
        "assets/tb_a_$a.png",
        height: (MediaQuery.of(context).size.height) * 0.50,
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          child: new Center(
            child: new Hero(
              tag: "hero$a",
              child: fun(a),
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => new EndPage()));
          },
          child: Icon(Icons.arrow_forward),
          foregroundColor: Color(0xFF128fff),
          backgroundColor: Color(0xFFffffff),
        ),
      ),
    );
  }
}
