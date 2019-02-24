import 'dart:convert';

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

class Answer extends StatelessWidget {
  int a;
  Answer(this.a);
  @override
  Widget build(BuildContext context) {
    CachedNetworkImage fun(var index) {
      // return new Image.asset(
      //     "https://sih-temper-app.herokuapp.com/assetrepo/${question_id[countPage]}/a_${a}.png",
      //     height: (MediaQuery.of(context).size.height) * 0.50);
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
          onPressed: countPage < 19
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
