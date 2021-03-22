import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({
    Key key, @required this.konvertHandler,
  }) : super(key: key);

  final Function konvertHandler;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        width: 100.0,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.9],
            colors: [
            // Colors are easy thanks to Flutter's Colors class.
              Color(0xff0096ff),
              Color(0xff6610f2),
            ],
          ),
        ),
        // ignore: deprecated_member_use
        child: RaisedButton(
          child: Text(
            'Convert',
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'CandaraBold',
            ),
          ),
          textColor: Colors.white,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          onPressed: konvertHandler,
        ),
      ),
    );
  }
}