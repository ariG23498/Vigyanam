import 'package:flutter/material.dart';
import 'answer_tf.dart';
import 'quizMain.dart';
import 'package:cached_network_image/cached_network_image.dart';

class tf extends StatefulWidget {
  @override
  _tfState createState() => _tfState();
}

class _tfState extends State<tf> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //for back navigation off
      onWillPop: () async => false,
      child: Scaffold(
        //scaffold off
        body: new Container(
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
                        child: new CircleAvatar(
                          child: new Icon(
                            Icons.check,
                            //
                            color: Color(0xFF128FFF),
                            //
                            size: MediaQuery.of(context).size.width * 0.20,
                          ),
                          maxRadius: MediaQuery.of(context).size.width * 0.10,
                          // backgroundColor: Colors.blue[100],
                          backgroundColor: Colors.white,
                          //
                        )),
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
                        child: new CircleAvatar(
                          child: new Icon(
                            Icons.clear,
                            size: MediaQuery.of(context).size.width * 0.20,
                            //
                            color: Color(0xFF128FFF),
                            //
                          ),
                          maxRadius: MediaQuery.of(context).size.width * 0.10,
                          // backgroundColor: Colors.blue[100],
                          backgroundColor: Colors.white,
                          //
                        )),
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
