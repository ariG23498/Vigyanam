import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'main.dart';
import 'animateAge.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Age extends StatefulWidget {
  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  Location location = new Location();
  bool recieveLoc = false;
  
  @override
  void initState() {
    super.initState();
    //default variables set is 0
    currentLocation['latitude'] = 0.0;
    currentLocation['longitude'] = 0.0;

    initPlatformState();
  }

  void initPlatformState() async {
    location.getLocation().then((myLocation) {
      setState(() {
        recieveLoc = true;
        currentLocation = myLocation;
        auth['latitude'] = currentLocation['latitude'];
        auth['longitude'] = currentLocation['longitude'];
      });
    });
  }

//the function that is used to make the age slab
  GestureDetector func(var a) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return new AnimateAge(a);
        }));
      },
      child: new Hero(
        tag: 'hero$a',
        child: CachedNetworkImage(
            imageUrl:
                "https://sih-temper-app.eu-gb.mybluemix.net/assetrepo/age_slab/age_${gender}_${a}.png",
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
            width: (MediaQuery.of(context).size.width) * 0.40,
            height: (MediaQuery.of(context).size.height) * 0.20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //if the location is recieved
    if (recieveLoc) {
      return Scaffold(
        //for Testing
        // body: new Center(
        //   child: new Text(
        //       "${currentLocation['longitude']}\n${currentLocation['latitude']}"),
        // ),
        //for Testing
        body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      func(1),
                      func(2),
                    ],
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      func(3),
                      func(4),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
    //if the location is not recieved
    else {
      return Scaffold(
        body: new Center(
          child: new Text("^_^"),
        ),
      );
    }
  }
}
