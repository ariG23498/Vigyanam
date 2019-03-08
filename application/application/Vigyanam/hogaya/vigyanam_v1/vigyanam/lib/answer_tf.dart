import 'package:flutter/material.dart';
import 'quizMain.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';
import 'end.dart';

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
            //
            color: Color(0xFF128FFF),
            //
          ),
          maxRadius: MediaQuery.of(context).size.width * 0.15,
          // backgroundColor: Colors.blue[100],
          backgroundColor: Colors.white,
          //
        );
      } else {
        return new CircleAvatar(
          child: new Icon(
            Icons.clear,
            size: MediaQuery.of(context).size.width * 0.25,
            //
            color: Color(0xFF128FFF),
            //
          ),
          maxRadius: MediaQuery.of(context).size.width * 0.15,
          // backgroundColor: Colors.blue[100],
          backgroundColor: Colors.white,
          //
        );
      }
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
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
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => EndPage()));
                  });
                },
          child: Icon(Icons.arrow_forward),
          foregroundColor: Color(0xFF128fff),
          backgroundColor: Color(0xFFffffff),
        ),
      ),
    );
  }
}

Future<void> sendJson() async {
  var s = await http.put(
      Uri.parse("https://sih-temper-app.herokuapp.com/calculate/${androidId}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(send),
      encoding: Encoding.getByName("utf-8"));
  print(s.body);
}
