import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        home: new _InboxHome(),
      );
    }
}

class _InboxHome extends StatefulWidget{
  @override
  State createState() => new InboxHomeState();
}

class InboxHomeState extends State<_InboxHome>{
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Inbox"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new FloatingActionButton(child: Icon(Icons.add),onPressed:(){} ,),
            new Row(children: <Widget>[
              new FloatingActionButton(child: Icon(Icons.add),onPressed:(){} ,),
              new FloatingActionButton(child: Icon(Icons.add),onPressed:(){} ,),
            ],mainAxisAlignment: MainAxisAlignment.spaceAround,)
          ],
        ),
      );
    }
}