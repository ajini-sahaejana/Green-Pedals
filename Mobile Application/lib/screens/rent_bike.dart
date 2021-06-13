import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_pedals/components/round_button_bigFont.dart';
import 'package:green_pedals/constants.dart';
import 'package:green_pedals/models/user.dart';
import 'package:green_pedals/services/database.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class RentBike extends StatefulWidget {
  @override
  _RentBikeState createState() => _RentBikeState();
}

class _RentBikeState extends State<RentBike> {
  Uint8List bytes = Uint8List(0);
  TextEditingController _inputController;
  TextEditingController _outputController;
  bool isWaiting = false;
  String msg = "";

  @override
  void initState() {
    super.initState();
    this._inputController = new TextEditingController();
    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back4.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    // Text(
                    //   'Hi ',
                    //   style: kSubTextStyle,
                    // ),
                    // Text(
                    //   'Ajini',
                    //   style: kSubTextStyle,
                    // ),
                    // Text(
                    //   '!',
                    //   style: kSubTextStyle,
                    // ),
                    // Spacer(),
                    // Container(
                    //   width: 36,
                    //   height: 36,
                    //   child: Image.asset(
                    //     'assets/icons/menu.png',
                    //     scale: 2,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: BackButton(
                      color: kSecondaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(43, 10, 100, 0),
                    child: kGreenLogowithName,
                  ),
                ],
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
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Please Scan the QR Code of the Slot",
                        style: kParaTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                msg,
                style: kValidateTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                child: Container(
                  child: InkWell(
                    onTap: _scan,
                    child: StreamBuilder<UserData>(
                        stream: DatabaseService().userDetails(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.waiting) if (snapshot.hasData) {
                            if (snapshot.data.bookedBike != null) {
                              return RoundButtonBigFont(
                                text: 'SCAN\nQR\nCODE\n',
                                msg: "To Return The Bike",
                                height: size.height / 3.5,
                                width: size.width / 1.5,
                                textColor: Colors.white,
                                backgroundColor: kPrimaryColor,
                                onPressed: null,
                              );
                            }
                            return RoundButtonBigFont(
                              text: 'SCAN\nQR\nCODE\n',
                              msg: "To Rent A Bike",
                              height: size.height / 3.5,
                              width: size.width / 1.5,
                              textColor: Colors.white,
                              backgroundColor: kPrimaryColor,
                              onPressed: null,
                            );
                          }
                          return RoundButtonBigFont(
                            text: 'SCAN\nQR\nCODE',
                            msg: "",
                            height: size.height / 3.5,
                            width: size.width / 1.5,
                            textColor: Colors.white,
                            backgroundColor: kPrimaryColor,
                            onPressed: null,
                          );
                        }),
                  ),
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
                'STATUS: ',
                style: kCardSubTextStyle,
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              if (isWaiting) Loading(),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<UserData>(
                  stream: DatabaseService().userDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Loading();
                    } else {
                      if (snapshot.hasData) {
                        if (snapshot.data.bookedBike != null) {
                          return Column(
                            children: [
                              Text(
                                'Bike Rental Successful',
                                style: kParaTextStyle,
                              ),
                              Text(
                                'You are on the way. Enjoy your ride!',
                                style: kParaTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'You can return it by scanning QR again!',
                                style: kParaSmallTextStyle,
                              ),
                            ],
                          );
                        }
                        return Text(
                          'Scan QR to rent the bike',
                          style: kParaTextStyle,
                        );
                      } else {
                        return Text(
                          'Scan QR to rent a bike',
                          style: kParaTextStyle,
                        );
                      }
                    }
                  }),
              SizedBox(
                height: 30,
              ),
              // TextField(
              //   controller: this._inputController,
              //   keyboardType: TextInputType.url,
              //   textInputAction: TextInputAction.go,
              //   onSubmitted: (value) => _generateBarCode(value),
              // ),
              // TextField(
              //   readOnly: true,
              //   controller: this._outputController,
              //   decoration: InputDecoration(
              //     //prefixIcon: Icon(Icons.wrap_text),
              //     contentPadding:
              //         EdgeInsets.symmetric(horizontal: 10, vertical: 19),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  setMsg(String msg) => setState(() {
        msg = msg;
      });
//scan
  Future _scan() async {
    setMsg("");
    try {
      await Permission.camera.request();
      String barcode = await scanner.scan();
      if (barcode == null) {
        setMsg("Invalid QR code! Please try again.");
        print('nothing returned');
      } else {
        // this._outputController.text = barcode;
        List<String> codes = barcode.split(',');
        if (codes.isNotEmpty) {
          _rentBike(codes[0], codes[1]);
        } else {
          setMsg("Invalid QR code! Please try again.");
        }
      }
    } catch (e) {
      setMsg("There was an error!");
    }
  }

  Future<void> _rentBike(String dockId, String slotId) async {
    setState(() {
      isWaiting = true;
    });
    await DatabaseService().updateBikeRentData(dockId, slotId);
    setState(() {
      isWaiting = false;
    });
  }

  Future _generateBarCode(String inputCode) async {
    Uint8List result = await scanner.generateBarCode(inputCode);
    this.setState(() => this.bytes = result);
    //print(result);
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        color: kSecLightColor,
      ),
    );
  }
}
