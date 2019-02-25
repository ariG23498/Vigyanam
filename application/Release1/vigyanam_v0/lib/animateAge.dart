import 'dart:convert';
import 'quizMain.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'errorPage.dart';

//error message
String error = "";
//error message

class AnimateAge extends StatefulWidget {
  final int a;
  AnimateAge(this.a);
  @override
  _AnimateAgeState createState() => _AnimateAgeState(a);
}

class _AnimateAgeState extends State<AnimateAge> {
  bool recieveAuth = false;

  final int a;
  _AnimateAgeState(this.a);

  @override
  initState() {
    super.initState();
    auth['age_slab'] = a;
    sendAuth().then((_) {
      print("Sent and recieved");
      setState(() {
        recieveAuth = true;
      });
    });
  }

  //function that makes the animation
  WillPopScope fun(var index) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: CachedNetworkImage(
          imageUrl:
              "https://sih-temper-app.herokuapp.com/assetrepo/age_slab/age_${index}.png",
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
      floatingActionButton: recieveAuth
          ? new FloatingActionButton(
              onPressed: () {
                print("I have Recieved it");
                print("Error is $error");
                if (error == "201") {
                  //QUIZ page
                  print("Quiz");
                  Navigator.push(context, new MaterialPageRoute(builder: (context)=>quizMain()));
                } else {
                  //ERROR page
                  print("Fuck Off");
                  Navigator.push(context, new MaterialPageRoute(builder: (context)=>ErrorPage()));
                }
              },
              child: Icon(Icons.arrow_forward),
              foregroundColor: Color(0xFF128fff),
              backgroundColor: Color(0xFFffffff),
            )
          : new FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color(0xFFffffff),
            ),
    );
  }
}

Future<void> sendAuth() async {
  print(auth);
  var s = await http.put(
      Uri.parse(
          "https://sih-temper-app.herokuapp.com/sendusrloc/${auth['usr_id']}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(auth),
      encoding: Encoding.getByName("utf-8"));
  Map l = json.decode(s.body);
  error = l['code'];
  print("error is $error");
  print(l);
}
