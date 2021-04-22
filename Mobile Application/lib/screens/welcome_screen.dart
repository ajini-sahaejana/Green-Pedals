import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:green_pedals/screens/user_signin.dart';
import 'package:splashscreen/splashscreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      navigateAfterSeconds: UserSignIn(),
      photoSize: 125,
      image: Image.asset(
        'assets/images/logo.png',
      ),
      // title: Text(
      //   'Green\nPedals'.toUpperCase(),
      //   style: kMainTitleTextStyle,
      //   textAlign: TextAlign.center,
      // ),
      //loadingText: Text('Please Wait..'),
      loaderColor: Colors.green,
      backgroundColor: Color(0xFF226431),
    );
  }
}
