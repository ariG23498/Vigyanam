import 'package:flutter/material.dart';
import 'Answer.dart';

class Quiz extends StatelessWidget {
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
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(15.0),
              ),
              new Image.asset("assets/cuboid.png",
                  height: (MediaQuery.of(context).size.height) * 0.55),
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new Answer(1);
                          }));
                        },
                        child: new Hero(
                            tag: 'hero1',
                            child: new CircleAvatar(
                              child: new Icon(
                                Icons.check,
                                size: MediaQuery.of(context).size.width * 0.25,
                              ),
                              maxRadius:  MediaQuery.of(context).size.width * 0.15,
                              backgroundColor: Colors.blue[100],
                            )),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      new GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return new Answer(2);
                          }));
                        },
                        child: new Hero(
                            tag: 'hero2',
                            child: new CircleAvatar(
                              child: new Icon(
                                Icons.clear,
                                size: MediaQuery.of(context).size.width * 0.25,
                              ),
                              maxRadius: MediaQuery.of(context).size.width * 0.15,
                              
                              backgroundColor: Colors.blue[100],
                            )),
                      ),
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
