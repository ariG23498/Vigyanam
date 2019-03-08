import 'package:flutter/material.dart';
import 'answer_tp.dart';
import 'quizMain.dart';
import 'package:cached_network_image/cached_network_image.dart';

class tp extends StatefulWidget {
  @override
  _tpState createState() => _tpState();
}

class _tpState extends State<tp> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //for back navigation off
      onWillPop: () async => false,
      child: Scaffold(
        body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //question
              new CachedNetworkImage(
                imageUrl:
                    "https://sih-temper-app.herokuapp.com/assetrepo/${question_id[countPage]}/q.png",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                height: (MediaQuery.of(context).size.height) * 0.45,
              ),

              //answer row
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //first answer
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return new Answer(1);
                      }));
                    },
                    child: new Hero(
                      tag: 'hero1',
                      child: new CachedNetworkImage(
                        imageUrl:
                            "https://sih-temper-app.herokuapp.com/assetrepo/${question_id[countPage]}/a_1.png",
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                        height: (MediaQuery.of(context).size.height) * 0.30,
                        width: (MediaQuery.of(context).size.width) * 0.30,
                      ),
                    ),
                  ),

                  //a little padding
                  new Padding(
                    padding: EdgeInsets.all(5.0),
                  ),

                  //second answer
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return new Answer(2);
                      }));
                    },
                    child: new Hero(
                      tag: 'hero2',
                      child: new CachedNetworkImage(
                        imageUrl:
                            "https://sih-temper-app.herokuapp.com/assetrepo/${question_id[countPage]}/a_2.png",
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                        height: (MediaQuery.of(context).size.height) * 0.30,
                        width: (MediaQuery.of(context).size.width) * 0.30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
