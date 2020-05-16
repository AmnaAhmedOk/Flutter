import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RateIcon extends StatefulWidget {

  @override
  RateIconState createState() => RateIconState();
}

class RateIconState extends State<RateIcon> {
  var pressedIcon=false;
  @override
  Widget build(BuildContext context) {

    return
      IconButton(
      icon: Icon(
        pressedIcon? Icons.star:Icons.star_border,
        size: pressedIcon?40:20,
        color: Colors.yellow,
      ),
      onPressed: () {
        setState(() {
          pressedIcon= !pressedIcon;
        });
      },
    );
  }
}
