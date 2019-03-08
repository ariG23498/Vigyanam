import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "BubbleUI",
    home: new MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  bool accepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Draggable(
              data: 5,
              child: Container(
                width: 100.0,
                height: 100.0,
                child: Center(
                  // child: Text(
                  //   "5",
                  //   style: TextStyle(color: Colors.white, fontSize: 22.0),
                  // )
                  child: Image.asset("assets/question.png"),
                ),
                color: Colors.transparent,
              ),
              feedback: Container(
                width: 100.0,
                height: 100.0,
                child: Center(
                  // child: Text(
                  //   "5",
                  //   style: TextStyle(color: Colors.white, fontSize: 22.0),
                  // )
                  child: Image.asset("assets/question.png"),
                ),
                color: Colors.transparent,
              ),
              childWhenDragging: Container(),
              onDraggableCanceled: (v,o){
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.green,
                  child: DragTarget(
                    builder: (context, List<int> candidateData, rejectedData) {
                      print(candidateData);

                      if (accepted) {
                        return Center(
                          child: Image.asset("assets/question.png"),
                        );
                      } else {
                        return Center();
                      }

                      // return Center(child: Text("Even", style: TextStyle(color: Colors.white, fontSize: 22.0),));
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      accepted = true;
                      // if(data % 2 == 0) {
                      //   scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Correct!")));
                      // } else {
                      //   scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Wrong!")));
                      // }
                    },
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.deepPurple,
                  child: DragTarget(
                    builder: (context, List<int> candidateData, rejectedData) {
                      // return Center(
                      //     child: Text(
                      //   "Odd",
                      //   style: TextStyle(color: Colors.white, fontSize: 22.0),
                      // ));

                      if (accepted) {
                        return Center(
                          child: Image.asset("assets/question.png"),
                        );
                      } else {
                        return Center();
                      }

                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      // if (data % 2 != 0) {
                      //   scaffoldKey.currentState
                      //       .showSnackBar(SnackBar(content: Text("Correct!")));
                      // } else {
                      //   scaffoldKey.currentState
                      //       .showSnackBar(SnackBar(content: Text("Wrong!")));
                      // }
                      accepted = true;
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
