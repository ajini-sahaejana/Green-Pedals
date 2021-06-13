import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_pedals/screens/welcome_screen.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GreenPedals(),
  );
}

class GreenPedals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}
