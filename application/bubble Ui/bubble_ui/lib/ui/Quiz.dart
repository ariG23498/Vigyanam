import 'package:flutter/material.dart';
import 'Answer.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var i = 0;

  GestureDetector func(var a) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return new Answer(a);
        }));
      },
      child: new Hero(
        tag: 'hero$a',
        child: new Image.asset("assets/global$a.png",
            height: (MediaQuery.of(context).size.height) * 0.30,
            width: (MediaQuery.of(context).size.width) ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

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
          child: new Column(
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
        ),
      ),
    );
  }
}
