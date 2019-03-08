import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final int a;
  Answer(this.a);

  @override
  Widget build(BuildContext context) {
    CircleAvatar fun(var index) {
      if (index == 1) {
        return new CircleAvatar(
          child: new Icon(
            Icons.check,
            size: MediaQuery.of(context).size.width * 0.25,
          ),
          maxRadius: MediaQuery.of(context).size.width * 0.15,
          backgroundColor: Colors.blue[100],
        );
      }
      else{
        return new CircleAvatar(
          child: new Icon(
            Icons.clear,
            size: MediaQuery.of(context).size.width * 0.25,
          ),
          maxRadius: MediaQuery.of(context).size.width * 0.15,
          backgroundColor: Colors.blue[100],
        );
      }
    }

    return Scaffold(
      body: new Container(
        // this code is used to get the gradient
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Color(0xFFffffff), Color(0xFFd2e8fc)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        // this code is used to get the gradient

        child: new Center(
          child: new Hero(
            tag: "hero$a",
            child: fun(a),
          ),
        ),
      ),
    );
  }
}
