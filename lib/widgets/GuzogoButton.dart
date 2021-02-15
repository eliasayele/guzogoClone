import 'package:flutter/material.dart';

class GuzogoButton extends StatelessWidget {
  //this widget used to is button
  //and created by passed the below properties

  final String title;
  final Color color;
  final Function onPressed;
  //constructor
  GuzogoButton({this.title, this.color, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10)),
      color: color,
      textColor: Colors.black,
      child: Container(
        height: 45.0,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'fontAwesome',
            ),
          ),
        ),
      ),
    );
  }
}
