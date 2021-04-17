import 'package:flutter/material.dart';
import 'package:green_pedals/screens/welcom_screen.dart';

void main() => runApp(GreenPedals());

class GreenPedals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
