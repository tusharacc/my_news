import 'package:flutter/material.dart';

Widget floatingButton(){
  print("I am in floating");
  return Scaffold(
    floatingActionButton: FloatingActionButton(onPressed: null,
    child: Column(
      children: <Widget>[
        Icon(Icons.stop),
        Icon(Icons.pause),
        Icon(Icons.volume_up),
        Icon(Icons.volume_down)
      ],
    ),),
  );
}

Widget nothing(){
  return null;
}