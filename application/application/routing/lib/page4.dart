import 'package:flutter/material.dart';
import 'main.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Page4"),
        centerTitle: true,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => shuffle(routes)[0]));
        },
        child: Icon(Icons.ac_unit),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
