import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_pedals/components/round_button_bigFont.dart';
import 'package:green_pedals/constants.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
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
              // SizedBox(
              //   height: size.height * 0.01,
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Container(
                  child: InkWell(
                    onTap: _scan,
                    child: RoundButtonBigFont(
                      text: 'SCAN\nQR\nCODE',
                      height: size.height / 4,
                      width: size.width / 1.5,
                      textColor: Colors.white,
                      backgroundColor: kPrimaryColor,
                      onPressed: null,
                    ),
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
                height: size.height * 0.01,
              ),
              Text(
                'Bike Rental Successful',
                style: kParaTextStyle,
              ),
              Text(
                'You are on the way. Enjoy your ride!',
                style: kParaTextStyle,
              ),
              TextField(
                controller: this._inputController,
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) => _generateBarCode(value),
              ),
              TextField(
                readOnly: true,
                controller: this._outputController,
                decoration: InputDecoration(
                  //prefixIcon: Icon(Icons.wrap_text),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 19),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//scan
  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      this._outputController.text = barcode;
    }
  }

  Future _generateBarCode(String inputCode) async {
    Uint8List result = await scanner.generateBarCode(inputCode);
    this.setState(() => this.bytes = result);
    //print(result);
  }
}
