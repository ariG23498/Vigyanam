import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var i = 0;

  Image func(var a) {
    return new Image.asset("assets/answer$a.png",
        height: (MediaQuery.of(context).size.height) * 0.20);
  }

  @override
  Widget build(BuildContext context) {
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
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.asset("assets/question.png",
                  height: (MediaQuery.of(context).size.height) * 0.55),
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // new Image.asset("assets/answer$i.png",
                      //     height: (MediaQuery.of(context).size.height) * 0.20),
                      func(++i),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      // new Image.asset("assets/answer${++i}.png",
                      //     height: (MediaQuery.of(context).size.height) * 0.20),
                      func(++i),
                    ],
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // new Image.asset("assets/answer${++i}.png",
                      //     height: (MediaQuery.of(context).size.height) * 0.20),
                      func(++i),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      // new Image.asset("assets/answer${++i}.png",
                      //     height: (MediaQuery.of(context).size.height) * 0.20),
                      func(++i),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
