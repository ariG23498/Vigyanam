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

        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Image.asset("assets/cuboid.png",
                height: (MediaQuery.of(context).size.height) * 0.45),


            new Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return new Answer(1);
                    }));
                  },
                  child: new Hero(
                      tag: 'hero1',
                      child: new CircleAvatar(
                        child: new Icon(
                          Icons.check,
                          size: MediaQuery.of(context).size.width * 0.20,
                        ),
                        maxRadius: MediaQuery.of(context).size.width * 0.10,
                        backgroundColor: Colors.blue[100],
                      )),
                ),
                new Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                new GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return new Answer(2);
                    }));
                  },
                  child: new Hero(
                      tag: 'hero2',
                      child: new CircleAvatar(
                        child: new Icon(
                          Icons.clear,
                          size: MediaQuery.of(context).size.width * 0.20,
                        ),
                        maxRadius: MediaQuery.of(context).size.width * 0.10,
                        backgroundColor: Colors.blue[100],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
