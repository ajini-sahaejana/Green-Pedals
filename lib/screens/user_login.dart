import 'package:flutter/material.dart';
import 'package:green_pedals/constants.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 15),
            child: Text(
              'Green Pedals'.toUpperCase(),
              style: kPageTitleTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
