import 'package:flutter/material.dart';
import 'quizMain.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';
import 'end.dart';
import 'quizMain1.dart';
import 'quizMain2.dart';

class Answer extends StatelessWidget {
  int a;
  Answer(this.a);
  @override
  Widget build(BuildContext context) {
    CachedNetworkImage fun(var index) {
      return CachedNetworkImage(
        imageUrl:
            "https://sih-temper-app.herokuapp.com/assetrepo/${question_id[countPage]}/a_${a}.png",
        placeholder: (context, url) => new CircularProgressIndicator(),
        errorWidget: (context, url, error) => new Icon(Icons.error),
        height: (MediaQuery.of(context).size.height) * 0.50,
      );
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
          onPressed: countPage <= 9
              ? () {
                  send['${question_id[countPage]}'] = 'a_$a';
                  countPage++;
                  print("Pressed count changes to $countPage");

                  if (countPage == 3) {
                    sendJson().then((_) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => quizMain1()));
                    });
                  } else if (countPage == 6) {
                    sendJson().then((_) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => quizMain2()));
                    });
                  } else if (countPage == 10) {
                    sendJson().then((_) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => EndPage()));
                    });
                  } else {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                routes['${ui_id[countPage]}']));
                  }
                }
              : () {},
          child: Icon(Icons.arrow_forward),
          foregroundColor: Color(0xFF128fff),
          backgroundColor: Color(0xFFffffff),
        ),
      ),
    );
  }
}

Future<void> sendJson() async {
  print(send);
  var s = await http.put(
      Uri.parse("https://sih-temper-app.herokuapp.com/calculate/$androidId"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(send),
      encoding: Encoding.getByName("utf-8"));
  print(s.body);
  overAllScore = json.decode(s.body)['score'];
  print("answer_cp");
}
