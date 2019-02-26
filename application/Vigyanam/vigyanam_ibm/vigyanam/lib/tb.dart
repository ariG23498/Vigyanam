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
              "https://sih-temper-app.eu-gb.mybluemix.net/assetrepo/${question_id[countPage]}/a_${a}.png",
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
        body: new Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
