import 'package:flutter/material.dart';
import './ui/Quiz.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Tinder",
    home: new Quiz(),
  ));
}