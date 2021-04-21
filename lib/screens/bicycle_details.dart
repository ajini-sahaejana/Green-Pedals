import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_pedals/constants.dart';

class BicycleDetails extends StatefulWidget {
  final String img;

  BicycleDetails({@required this.img});

  @override
  _BicycleDetailsState createState() => _BicycleDetailsState();
}

class _BicycleDetailsState extends State<BicycleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 20,
              child: Card(
                elevation: 4,
                child: Container(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: BackButton(),
                  ),
                ),
              ),
            ),
            Positioned(
              child: CircleAvatar(
                radius: 124,
                backgroundColor: Colors.orange[50],
              ),
              right: 20,
              top: 100,
            ),
            Positioned(
              child: SizedBox(
                  height: 250,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                        widget.img,
                      ),
                    )),
                  )),
              left: 64,
              right: 64,
              top: 150,
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Go Cycle",
                              style: kTitleTextStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "An Eco-Friendly Bike",
                                style: kCardSubTextStyle,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Rs. 100/=",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        //Text(" /hour")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Walk in the wind, indulge in thousands of miles, feel the beauty of speed, and follow the freedom of the wind.',
                      style: kParaTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              top: 400,
              left: 20,
              right: 20,
            ),
            Positioned(
              child: Center(
                child: Container(
                  width: 250,
                  height: 100,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextButton(
                    child: Text(
                      'UNLOCK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Comfortaa',
                        fontSize: 25.0,
                        wordSpacing: 2,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      backgroundColor: kSecondaryColor.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              bottom: 20,
              left: 20,
              right: 20,
            )
          ],
        ),
      ),
    );
  }
}
