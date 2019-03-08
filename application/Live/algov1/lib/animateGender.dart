import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'main.dart';
import 'ageSlab.dart';

//error message
String error = "";
//error message

class AnimateGender extends StatefulWidget {
  final String a;
  AnimateGender(this.a);
  @override
  _AnimateGenderState createState() => _AnimateGenderState(a);
}

class _AnimateGenderState extends State<AnimateGender> {
  bool recieveAuth = false;

  final String a;
  _AnimateGenderState(this.a);

  @override
  initState() {
    super.initState();
    gender = a;
    auth['gender'] = a;
  }

  //function that makes the animation
  WillPopScope fun(String index) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: CachedNetworkImage(
          imageUrl:
              "https://sih-temper-app.eu-gb.mybluemix.net/assetrepo/gender/g_$index.png",
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          height: (MediaQuery.of(context).size.height) * 0.70,
          width: (MediaQuery.of(context).size.width) * 0.70),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Center(
          child: new Hero(
            tag: "hero$a",
            child: fun(a),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => Age()));
        },
        child: Icon(Icons.arrow_forward),
        foregroundColor: Color(0xFF128fff),
        backgroundColor: Color(0xFFffffff),
      ),
    );
  }
}
