import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(new MaterialApp(
    home: new HeroAnimation(),
  ));
}

class PhotoHero extends StatelessWidget {
  String photo;
  VoidCallback ontap;
  double width;

  PhotoHero({Key key, this.photo, this.ontap, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: new Hero(
        tag: photo,
        child: new Material(
          child: new InkWell(
            onTap: ontap,
            child: new Image.asset(photo),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 4.0; //1.0 means normal animation speed
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Color(0xFFf56703), Color(0xFFFFE001)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: new PhotoHero(
            photo: "assets/answer1.png",
            width: 600.0,
            ontap: () {
              Navigator.of(context).push(
                  new MaterialPageRoute<Null>(builder: (BuildContext context) {
                return Scaffold(
                  body: new Container(
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [Color(0xFFf56703), Color(0xFFFFE001)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    child: new PhotoHero(
                      photo: "assets/answer1.png",
                      width: 300.0,
                    ),
                  ),
                );
              }));
            },
          ),
        ),
      ),
    );
  }
}
