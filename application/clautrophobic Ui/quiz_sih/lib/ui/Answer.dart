import 'package:flutter/material.dart';
import 'Quiz.dart';

class Answer extends StatelessWidget {
  int a;
  Answer(this.a);


  @override
  Widget build(BuildContext context) {
    Image fun(var index) {
      return new Image.asset("assets/answer$index.png",
          height: (MediaQuery.of(context).size.height) * 0.50);
    }

    return Scaffold(
      body: new Container(
        // this code is used to get the gradient
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Color(0xFFf56703), Color(0xFFFFE001)],
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
