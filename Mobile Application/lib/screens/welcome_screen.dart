import 'package:flutter/material.dart';
import 'package:green_pedals/constants.dart';
import 'package:green_pedals/models/userdetails.dart';
import 'package:green_pedals/screens/wrapper.dart';
import 'package:green_pedals/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserDetails>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: Wrapper(),
          photoSize: 175,

          image: Image.asset(
            'assets/images/whitewithname.png',
          ),
          // title: Text(
          //   'Green\nPedals'.toUpperCase(),
          //   style: kLogoTextLight,
          //   textAlign: TextAlign.center,
          // ),
          loadingText: Text(
            'Please Wait..',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          loaderColor: Colors.white,
          backgroundColor: kSecondaryColor,
          imageBackground: AssetImage("assets/images/back5.png"),
        ),
      ),
    );
  }
}
