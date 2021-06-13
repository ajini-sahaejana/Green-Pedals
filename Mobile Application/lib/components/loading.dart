import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:green_pedals/constants.dart';

class Loading extends StatelessWidget {
  //const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitDoubleBounce(
          color: kPrimaryLightColor,
          size: 40.0,
        ),
      ),
    );
  }
}
