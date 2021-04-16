import 'dart:ui';

import 'package:flutter/material.dart';
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
      seconds: 5,
      navigateAfterSeconds: UserLogin(),
      photoSize: 50,
      image: Image.asset(
        'assets/images/logo.png',
      ),
      loadingText: Text('Please Wait..'),
      backgroundColor: Color(0xFF226431),
      loaderColor: Colors.green,
    );
  }
}
