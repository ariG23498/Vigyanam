import 'package:flutter/material.dart';
import 'main.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Page3"),
        centerTitle: true,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => shuffle(routes)[0]));
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
