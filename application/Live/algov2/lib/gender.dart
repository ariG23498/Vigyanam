import 'package:flutter/material.dart';
import 'main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'animateGender.dart';

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  GestureDetector func(String a) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return new AnimateGender(a);
        }));
      },
      child: new Hero(
        tag: 'hero$a',
        child: CachedNetworkImage(
            imageUrl:
                "https://sih-temper-app.herokuapp.com/assetrepo/gender/g_$a.png",
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
            width: (MediaQuery.of(context).size.width) * 0.40,
            height: (MediaQuery.of(context).size.height) * 0.20),
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
                func("M"),
                new Padding(padding: EdgeInsets.all(5.0)),
                func("F"),
                new Padding(padding: EdgeInsets.all(5.0)),
                func("O"),
                new Padding(padding: EdgeInsets.all(5.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
