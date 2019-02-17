import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  int a;
  Answer(this.a);


  @override
  Widget build(BuildContext context) {
    Image fun(var index) {
      return new Image.asset("assets/global$index.png",
          // height: (MediaQuery.of(context).size.height) * 0.70,
          width: (MediaQuery.of(context).size.width),);
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
