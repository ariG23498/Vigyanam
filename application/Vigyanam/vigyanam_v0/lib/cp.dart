import 'package:flutter/material.dart';
import 'main.dart';
import 'answer_cp.dart';
import 'package:cached_network_image/cached_network_image.dart';

class cp extends StatefulWidget {
  @override
  _cpState createState() => _cpState();
}

class _cpState extends State<cp> {
  //make answers
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
          width: (MediaQuery.of(context).size.width) * 0.40,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //question
              new CachedNetworkImage(
                imageUrl:
                    "https://sih-temper-app.herokuapp.com/assetrepo/${question_id[countPage]}/q.png",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                height: (MediaQuery.of(context).size.height) * 0.55,
              ),

              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      func(1),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      func(2),
                    ],
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      func(3),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
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
