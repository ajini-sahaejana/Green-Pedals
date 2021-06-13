import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_pedals/models/userdetails.dart';
import 'package:green_pedals/screens/authenticate/authenticate.dart';
import 'package:green_pedals/screens/homepage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserDetails>(context);
    print(user);
    //return authenticate/home
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
