import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:green_pedals/constants.dart';
import 'package:green_pedals/screens/user_login.dart';
import 'package:splashscreen/splashscreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: UserLogin(),
      photoSize: 175,
      image: Image.asset(
        'assets/images/image1.png',
      ),
      title: Text(
        'Green Pedals'.toUpperCase(),
        style: kMainTitleTextStyle,
        textAlign: TextAlign.center,
      ),
      loadingText: Text('Please Wait..'),
      loaderColor: Colors.green,
    );
  }
}
