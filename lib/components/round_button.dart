import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({
    @required this.text,
    @required this.height,
    @required this.width,
    @required this.textColor,
    @required this.backgroundColor,
    @required this.onPressed,
  });

  final String text;
  final Function onPressed;
  final double height;
  final double width;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.8,
      height: height,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontFamily: 'Comfortaa',
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
