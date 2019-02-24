import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Answer extends StatelessWidget {
  int a;
  Answer(this.a);

  @override
  Widget build(BuildContext context) {
    CircleAvatar fun(var index) {
      if (index == 1) {
        return new CircleAvatar(
          child: new Icon(
            Icons.check,
            size: MediaQuery.of(context).size.width * 0.25,
          ),
          maxRadius: MediaQuery.of(context).size.width * 0.15,
          backgroundColor: Colors.blue[100],
        );
      } else {
        return new CircleAvatar(
          child: new Icon(
            Icons.clear,
            size: MediaQuery.of(context).size.width * 0.25,
          ),
          maxRadius: MediaQuery.of(context).size.width * 0.15,
          backgroundColor: Colors.blue[100],
        );
      }
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
            child: new Hero(
              tag: "hero$a",
              child: fun(a),
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: countPage <= 19
              ? () {
                  send['${question_id[countPage]}'] = 'a_$a';
                  countPage++;

                  print(countPage);

                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => routes['${ui_id[countPage]}']));
                }
              : () {
                  send['${question_id[countPage]}'] = 'a_$a';
                  sendJson().then((_) {
                    print("End");
                  });
                },
        ),
      ),
    );
  }
}

Future<void> sendJson() async {
  var s = await http.put(
      Uri.parse("https://sih-temper-app.herokuapp.com/calculate/${user_id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(send),
      encoding: Encoding.getByName("utf-8"));
  print(s.body);
}
