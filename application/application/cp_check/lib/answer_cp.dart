import 'package:flutter/material.dart';
import 'main.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
            "https://sih-temper-app.herokuapp.com/assetrepo/cs_cp_6/a_${a}.png",
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
          onPressed: (){},
        ),
      ),
    );
  }
}
