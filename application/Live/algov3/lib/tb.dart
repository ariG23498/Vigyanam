import 'package:flutter/material.dart';
import 'quizMain.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'answer_tb.dart';

class tb extends StatefulWidget {
  @override
  _tbState createState() => _tbState();
}

class _tbState extends State<tb> {
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
        child: new CachedNetworkImage(
          imageUrl:
              "https://sih-temper-app.herokuapp.com/assetrepo/${question_id[countPage]}/a_${a}.png",
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          height: (MediaQuery.of(context).size.height) * 0.20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: new Border.all(color: Colors.yellow, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.yellow),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.info_outline,
                          color: Colors.blueAccent,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        ),
                        Text(
                          "${hint[countPage]}",
                          style:
                              TextStyle(color: Color(0xFF0a0a0a), fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(5.0)),
                  func(1),
                  new Padding(padding: EdgeInsets.all(5.0)),
                  func(2),
                  new Padding(padding: EdgeInsets.all(5.0)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
