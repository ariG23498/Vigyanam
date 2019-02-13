import 'package:flutter/material.dart';
import 'Answer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var i = 0;
  List<String> l = new List();

  @override
  void initState() {
    super.initState();

    l.add("assets/question.png");
    l.add("assets/answer1.png");
    l.add("assets/answer2.png");
    l.add("assets/answer3.png");
  }

  CarouselSlider instance;

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
        child: new Image.asset("assets/answer$a.png",
            height: (MediaQuery.of(context).size.height) * 0.20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    instance = new CarouselSlider(
      autoPlay: true,
      autoPlayDuration: Duration(seconds: 4),
      items: l.map((member) {
        return new Image.asset(member,
            height: (MediaQuery.of(context).size.height));
      }).toList(),
    );

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              instance,
              // new Image.asset("assets/question.png",
              //     height: (MediaQuery.of(context).size.height) * 0.55),

              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // new Image.asset("assets/answer$i.png",
                      //     height: (MediaQuery.of(context).size.height) * 0.20),
                      func(1),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      // new Image.asset("assets/answer${++i}.png",
                      //     height: (MediaQuery.of(context).size.height) * 0.20),
                      func(2),
                    ],
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // new Image.asset("assets/answer${++i}.png",
                      //     height: (MediaQuery.of(context).size.height) * 0.20),
                      func(3),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      // new Image.asset("assets/answer${++i}.png",
                      //     height: (MediaQuery.of(context).size.height) * 0.20),
                      func(4),
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
