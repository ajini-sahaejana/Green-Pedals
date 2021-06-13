import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_pedals/screens/authenticate/user_signin.dart';
import 'package:green_pedals/screens/authenticate/user_signup.dart';

class Authenticate extends StatefulWidget {
  //const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return UserSignIn(toggleView: toggleView);
    } else {
      return UserSignUp(toggleView: toggleView);
    }
  }
}
