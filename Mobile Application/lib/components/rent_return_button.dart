import 'package:flutter/material.dart';

class RentReturnButton extends StatelessWidget {
  RentReturnButton({
    @required this.text,
    @required this.height,
    @required this.width,
    @required this.textColor,
    @required this.backgroundColor,
    @required this.onPressed,
    this.msg = "",
  });

  final String text;
  final String msg;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontFamily: 'Comfortaa',
                fontSize: 35.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white54,
                fontFamily: 'Comfortaa',
                fontSize: 22.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
          ],
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
