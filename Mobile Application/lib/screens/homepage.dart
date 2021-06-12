import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_pedals/components/round_button_bigFont.dart';
import 'package:green_pedals/constants.dart';
import 'package:green_pedals/screens/rent_bike.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  children: [
                    Text(
                      'Hi ',
                      style: kSubTextStyle,
                    ),
                    Text(
                      'Ajini',
                      style: kSubTextStyle,
                    ),
                    Text(
                      '!',
                      style: kSubTextStyle,
                    ),
                    Spacer(),
                    Container(
                      width: 36,
                      height: 30,
                      child: Image.asset(
                        'assets/icons/menu.png',
                        scale: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 10),
                child: kGreenLogowithName,
              ),
              Text.rich(
                TextSpan(
                  text: "GREEN",
                  style: kLogoText,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "PEDALS",
                  style: kLogoText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 125, 20, 10),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Get Your Ride Now!",
                        style: kSubTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: size.height * 0.01,
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: RoundButtonBigFont(
                  text: 'Rent/Return Bike',
                  height: size.height / 4,
                  width: size.width / 1.5,
                  textColor: Colors.white,
                  backgroundColor: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RentBike(),
                      ),
                    );
                  },
                ),
              ),
              // CheckBikeStatus(
              //   status: true,
              //   press: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return ProductCard();
              //         },
              //       ),
              //     );
              //   },
              // ),
              // SizedBox(
              //   height: size.height * 0.03,
              // ),
              Text(
                'VIEW TRANSACTIONS',
                style: kSecondaryButtonTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
